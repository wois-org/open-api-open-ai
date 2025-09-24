defmodule OpenAi.Responses do
  @moduledoc """
  Provides API endpoints related to responses
  """

  @default_client OpenAi.Client

  @doc """
  Creates a model response. Provide [text](/docs/guides/text) or
  [image](/docs/guides/images) inputs to generate [text](/docs/guides/text)
  or [JSON](/docs/guides/structured-outputs) outputs. Have the model call
  your own [custom code](/docs/guides/function-calling) or use built-in
  [tools](/docs/guides/tools) like [web search](/docs/guides/tools-web-search)
  or [file search](/docs/guides/tools-file-search) to use your own data
  as input for the model's response.

  """
  @spec create_response(body :: OpenAi.Response.Create.t(), opts :: keyword) ::
          {:ok,
           OpenAi.Response.t()
           | OpenAi.Response.Audio.DeltaEvent.t()
           | OpenAi.Response.Audio.DoneEvent.t()
           | OpenAi.Response.Audio.Transcript.DeltaEvent.t()
           | OpenAi.Response.Audio.Transcript.DoneEvent.t()
           | OpenAi.Response.CodeInterpreter.Call.Code.DeltaEvent.t()
           | OpenAi.Response.CodeInterpreter.Call.Code.DoneEvent.t()
           | OpenAi.Response.CodeInterpreter.Call.CompletedEvent.t()
           | OpenAi.Response.CodeInterpreter.Call.InProgressEvent.t()
           | OpenAi.Response.CodeInterpreter.Call.InterpretingEvent.t()
           | OpenAi.Response.CompletedEvent.t()
           | OpenAi.Response.ContentPart.AddedEvent.t()
           | OpenAi.Response.ContentPart.DoneEvent.t()
           | OpenAi.Response.CreatedEvent.t()
           | OpenAi.Response.ErrorEvent.t()
           | OpenAi.Response.FailedEvent.t()
           | OpenAi.Response.FileSearch.Call.CompletedEvent.t()
           | OpenAi.Response.FileSearch.Call.InProgressEvent.t()
           | OpenAi.Response.FileSearch.Call.SearchingEvent.t()
           | OpenAi.Response.Function.Call.ArgumentsDeltaEvent.t()
           | OpenAi.Response.Function.Call.ArgumentsDoneEvent.t()
           | OpenAi.Response.InProgressEvent.t()
           | OpenAi.Response.IncompleteEvent.t()
           | OpenAi.Response.Output.Item.AddedEvent.t()
           | OpenAi.Response.Output.Item.DoneEvent.t()
           | OpenAi.Response.Reasoning.Summary.Part.AddedEvent.t()
           | OpenAi.Response.Reasoning.Summary.Part.DoneEvent.t()
           | OpenAi.Response.Reasoning.Summary.Text.DeltaEvent.t()
           | OpenAi.Response.Reasoning.Summary.Text.DoneEvent.t()
           | OpenAi.Response.Refusal.DeltaEvent.t()
           | OpenAi.Response.Refusal.DoneEvent.t()
           | OpenAi.Response.Text.AnnotationDeltaEvent.t()
           | OpenAi.Response.Text.DeltaEvent.t()
           | OpenAi.Response.Text.DoneEvent.t()
           | OpenAi.Response.WebSearch.Call.CompletedEvent.t()
           | OpenAi.Response.WebSearch.Call.InProgressEvent.t()
           | OpenAi.Response.WebSearch.Call.SearchingEvent.t()}
          | {:error, OpenAi.Error.error()}
  def create_response(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Responses, :create_response},
      url: "/responses",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Response.Create, :t}}],
      response: [
        {200,
         {:union,
          [
            {OpenAi.Response, :t},
            {OpenAi.Response.Audio.DeltaEvent, :t},
            {OpenAi.Response.Audio.DoneEvent, :t},
            {OpenAi.Response.Audio.Transcript.DeltaEvent, :t},
            {OpenAi.Response.Audio.Transcript.DoneEvent, :t},
            {OpenAi.Response.CodeInterpreter.Call.Code.DeltaEvent, :t},
            {OpenAi.Response.CodeInterpreter.Call.Code.DoneEvent, :t},
            {OpenAi.Response.CodeInterpreter.Call.CompletedEvent, :t},
            {OpenAi.Response.CodeInterpreter.Call.InProgressEvent, :t},
            {OpenAi.Response.CodeInterpreter.Call.InterpretingEvent, :t},
            {OpenAi.Response.CompletedEvent, :t},
            {OpenAi.Response.ContentPart.AddedEvent, :t},
            {OpenAi.Response.ContentPart.DoneEvent, :t},
            {OpenAi.Response.CreatedEvent, :t},
            {OpenAi.Response.ErrorEvent, :t},
            {OpenAi.Response.FailedEvent, :t},
            {OpenAi.Response.FileSearch.Call.CompletedEvent, :t},
            {OpenAi.Response.FileSearch.Call.InProgressEvent, :t},
            {OpenAi.Response.FileSearch.Call.SearchingEvent, :t},
            {OpenAi.Response.Function.Call.ArgumentsDeltaEvent, :t},
            {OpenAi.Response.Function.Call.ArgumentsDoneEvent, :t},
            {OpenAi.Response.InProgressEvent, :t},
            {OpenAi.Response.IncompleteEvent, :t},
            {OpenAi.Response.Output.Item.AddedEvent, :t},
            {OpenAi.Response.Output.Item.DoneEvent, :t},
            {OpenAi.Response.Reasoning.Summary.Part.AddedEvent, :t},
            {OpenAi.Response.Reasoning.Summary.Part.DoneEvent, :t},
            {OpenAi.Response.Reasoning.Summary.Text.DeltaEvent, :t},
            {OpenAi.Response.Reasoning.Summary.Text.DoneEvent, :t},
            {OpenAi.Response.Refusal.DeltaEvent, :t},
            {OpenAi.Response.Refusal.DoneEvent, :t},
            {OpenAi.Response.Text.AnnotationDeltaEvent, :t},
            {OpenAi.Response.Text.DeltaEvent, :t},
            {OpenAi.Response.Text.DoneEvent, :t},
            {OpenAi.Response.WebSearch.Call.CompletedEvent, :t},
            {OpenAi.Response.WebSearch.Call.InProgressEvent, :t},
            {OpenAi.Response.WebSearch.Call.SearchingEvent, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @doc """
  Deletes a model response with the given ID.

  """
  @spec delete_response(response_id :: String.t(), opts :: keyword) ::
          :ok | {:error, OpenAi.Error.error()}
  def delete_response(response_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [response_id: response_id],
      call: {OpenAi.Responses, :delete_response},
      url: "/responses/#{response_id}",
      method: :delete,
      response: [{200, :null}, {404, {OpenAi.ResError, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a model response with the given ID.


  ## Options

    * `include`: Additional fields to include in the response. See the `include`
      parameter for Response creation above for more information.
      

  """
  @spec get_response(response_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Response.t()} | {:error, OpenAi.Error.error()}
  def get_response(response_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include])

    client.request(%{
      args: [response_id: response_id],
      call: {OpenAi.Responses, :get_response},
      url: "/responses/#{response_id}",
      method: :get,
      query: query,
      response: [{200, {OpenAi.Response, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of input items for a given response.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between
      1 and 100, and the default is 20.
      
    * `order`: The order to return the input items in. Default is `asc`.
      - `asc`: Return the input items in ascending order.
      - `desc`: Return the input items in descending order.
      
    * `after`: An item ID to list items after, used in pagination.
      
    * `before`: An item ID to list items before, used in pagination.
      
    * `include`: Additional fields to include in the response. See the `include`
      parameter for Response creation above for more information.
      

  """
  @spec list_input_items(response_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Response.ItemList.t()} | {:error, OpenAi.Error.error()}
  def list_input_items(response_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :include, :limit, :order])

    client.request(%{
      args: [response_id: response_id],
      call: {OpenAi.Responses, :list_input_items},
      url: "/responses/#{response_id}/input_items",
      method: :get,
      query: query,
      response: [{200, {OpenAi.Response.ItemList, :t}}],
      opts: opts
    })
  end
end
