defmodule OpenAi.Mocks.Response do
  @moduledoc """
  Mocks for response related responses.
  """
  def object(data) do
    %{
      background: false,
      billing: %{payer: "developer"},
      created_at: 1_764_246_539,
      error: nil,
      id: "resp_XXXX",
      incomplete_details: nil,
      instructions: "Be a friendly chatbot",
      max_output_tokens: nil,
      max_tool_calls: nil,
      model: "gpt-4o-mini-2024-07-18",
      object: "response",
      parallel_tool_calls: true,
      previous_response_id: nil,
      prompt_cache_key: nil,
      prompt_cache_retention: nil,
      safety_identifier: nil,
      service_tier: "default",
      status: "completed",
      store: true,
      temperature: 1.0,
      tool_choice: "auto",
      tools: [],
      top_logprobs: 0,
      top_p: 1.0,
      truncation: "disabled",
      user: nil
    }
    |> Map.merge(data)
    |> Map.merge(%{
      metadata: data |> Map.get(:metadata, %{"key" => "value"}),
      output: data |> Map.get(:output, [%{}]) |> Enum.map(&response_output(&1)),
      reasoning: data |> Map.get(:reasoning, %{}) |> response_reasoning(),
      text: data |> Map.get(:text, %{}) |> response_text(),
      usage: data |> Map.get(:usage, %{}) |> response_usage()
    })
  end

  def response_output(data) do
    %{
      id: "msg_XXXX",
      role: "assistant",
      status: "completed",
      type: "message"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      content: data |> Map.get(:content, [%{}]) |> Enum.map(&response_output_message(&1))
    })
  end

  def response_output_message(data) do
    %{
      annotations: [],
      logprobs: [],
      text: "Hi there!",
      type: "output_text"
    }
    |> Map.merge(data)
  end

  def response_reasoning(data) do
    %{effort: nil, summary: nil}
    |> Map.merge(data)
  end

  def response_text(data) do
    %{format: %{type: "text"}, verbosity: "medium"}
    |> Map.merge(data)
  end

  def response_usage(data) do
    %{
      input_tokens: 20,
      input_tokens_details: %{cached_tokens: 0},
      output_tokens: 16,
      output_tokens_details: %{reasoning_tokens: 0},
      total_tokens: 36
    }
    |> Map.merge(data)
    |> Map.merge(%{
      input_tokens_details:
        data |> Map.get(:output_tokens_details, %{}) |> response_usage_input_tokens_details(),
      output_tokens_details:
        data |> Map.get(:output_tokens_details, %{}) |> response_usage_output_tokens_details()
    })
  end

  def response_usage_input_tokens_details(data) do
    %{cached_tokens: 0}
    |> Map.merge(data)
  end

  def response_usage_output_tokens_details(data) do
    %{reasoning_tokens: 0}
    |> Map.merge(data)
  end
end
