defmodule OpenAi.Client.Stream do
  @moduledoc """
  Module for transforming streaming responses.

  When passing a `stream` parameter to any operation that supports streaming, like:
  - `OpenAi.Assistants.submit_tool_outputs_to_run/4`
  - `OpenAi.Assistants.create_thread_and_run/2`
  - `OpenAi.Assistants.create_run/2`
  - `OpenAi.Chat.create_chat_completion/2`
  - `OpenAi.Completions.create_completion/2`

  Additional parameter `stream_to` should be passed to specify which process should handle the stream.
  Generally, it may be the calling process, like `self()`.

  This module provides functions to transform the stream of events into structured data.
  The operation that supports streaming will return a stream of transformed events.
  They can be processed by a consumer, like a Phoenix channel.

  ## Example:
      OpenAi.Assistants.create_run(%OpenAi.Run.CreateRequest{
        stream: true,
        ...
      }, stream_to: self())
      |> Stream.each(fn
        {:ok, event} ->
          # Handle event
        {:error, error} ->
          # Handle error
      end)

  Event will have a structure like:

  ```elixir
  %{
    event: "thread.message.delta",
    data: %OpenAi.Message.Delta{}
  }
  ```
  """
  require Logger
  alias OpenAi.Client.Struct

  @doc false
  def transform(resp) do
    resp
    |> start()
    |> split_joined_events()
    |> join_event_chunks()
    |> decode_chunks()
  end

  defp start(resp) do
    Stream.resource(
      fn -> resp end,
      fn %HTTPoison.AsyncResponse{id: id} = resp ->
        receive do
          %HTTPoison.AsyncStatus{id: ^id, code: 200} ->
            {[], resp}

          %HTTPoison.AsyncStatus{id: ^id, code: code} ->
            {:halt,
             %{
               id: id,
               error: "Request failed with status code: #{code}"
             }}

          %HTTPoison.AsyncHeaders{id: ^id, headers: _headers} ->
            {[], resp}

          %HTTPoison.AsyncChunk{id: ^id, chunk: "event: done\ndata: [DONE]\n\n"} ->
            {:halt, resp}

          %HTTPoison.AsyncChunk{id: ^id, chunk: chunk} ->
            {[chunk], resp}

          %HTTPoison.AsyncEnd{id: ^id} ->
            {:halt, resp}

          msg ->
            Logger.debug("Received unexpected message: #{inspect(msg)}")
            HTTPoison.stream_next(resp)
            {[], resp}
        end
      end,
      fn resp ->
        :hackney.stop_async(resp.id)
      end
    )
  end

  # Split chunks with multiple events into separate events.
  defp split_joined_events(stream) do
    Stream.flat_map(stream, fn chunk ->
      # Split chunk into events
      # With regex lookbehind and lookahead to split on double newline
      # followed by "event:"
      # https://www.regular-expressions.info/lookaround.html
      chunk |> String.split(~r/(?<=\n\n)(?=event:)/)
    end)
  end

  # Concatenate chunks for events that are split across multiple chunks.
  defp join_event_chunks(stream) do
    chunk_fun = fn chunk, acc ->
      chunk
      |> String.ends_with?("}\n\n")
      |> if do
        {:cont, acc <> chunk, ""}
      else
        {:cont, acc <> chunk}
      end
    end

    after_fun = fn
      "" -> {:cont, ""}
      acc -> {:cont, acc, ""}
    end

    Stream.chunk_while(stream, "", chunk_fun, after_fun)
  end

  defp decode_chunks(stream) do
    Stream.map(stream, &decode_chunk(&1))
  end

  defp decode_chunk(chunk) do
    # Parse chunk into event object, action, and data
    # With regex named captures
    # https://www.regular-expressions.info/named.html
    ~r/^event: (?<object>[a-z.]+)\.(?<action>[a-z_]+)\ndata: (?<data>.*)\n\n$/
    |> Regex.named_captures(chunk)
    |> decode_event(chunk)
    |> transform_event(chunk)
  end

  defp decode_event(%{"object" => object, "data" => data, "action" => action}, _chunk) do
    data
    |> Poison.decode()
    |> case do
      {:ok, decoded_data} ->
        {:ok,
         %{
           action: action,
           object: object,
           data: decoded_data
         }}

      {:error, error} ->
        {:error,
         %__MODULE__.Error{
           message: "Failed to decode event data: #{inspect(error)}",
           data: data
         }}
    end
  end

  defp decode_event(nil, chunk) do
    {:error,
     %__MODULE__.Error{
       message: "Failed to match event in chunk",
       data: chunk
     }}
  end

  defp transform_event({:ok, %{object: object, action: action, data: data}}, chunk) do
    struct =
      ("elixir.open_ai." <> object)
      |> String.replace("thread.run", "run")
      |> String.replace("thread.message", "message")
      |> case do
        "elixir.open_ai.message" when action == "delta" -> "elixir.open_ai.message.delta"
        "elixir.open_ai.run.step" when action == "delta" -> "elixir.open_ai.run.step.delta"
        name -> name
      end
      |> String.replace(".", "/")
      |> Macro.camelize()
      |> String.to_existing_atom()

    data
    |> Struct.transform(struct, :t)
    |> case do
      {:ok, transformed_data} ->
        {:ok, %{event: "#{object}.#{action}", data: transformed_data}}

      {:error, error} ->
        {:error,
         %__MODULE__.Error{
           message: "Failed to transform response chunk data: #{inspect(error)}",
           data: chunk
         }}
    end
  end

  defp transform_event({:error, error}, _chunk) do
    {:error, error}
  end
end
