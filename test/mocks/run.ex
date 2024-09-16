defmodule OpenAi.Mocks.Run do
  @moduledoc """
  Mocks for run related responses.
  """
  def object(data) do
    %{
      assistant_id: "a_abcd1234",
      cancelled_at: 123_456,
      completed_at: 123_456,
      created_at: 123_456,
      expires_at: 123_456,
      failed_at: 123_456,
      id: "r_abcd1234",
      instructions: "instructions",
      max_completion_tokens: 1000,
      max_prompt_tokens: 1000,
      model: "text-embedding-ada-002",
      object: "thread.run",
      parallel_tool_calls: true,
      started_at: 123_456,
      status: "completed",
      temperature: 0.5,
      thread_id: "t_abcd1234"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      incomplete_details: data |> Map.get(:incomplete_details, %{}) |> incomplete_details(),
      last_error: data |> Map.get(:last_error, %{}) |> last_error(),
      metadata: data |> Map.get(:metadata, %{"key" => "value"}),
      required_action: data |> Map.get(:required_action, %{}) |> required_action(),
      response_format:
        data |> Map.get(:response_format, "auto") |> OpenAi.Mocks.Assistant.response_format(),
      tool_choice: data |> Map.get(:tool_choice, %{}) |> OpenAi.Mocks.Assistant.tool_choice(),
      tools:
        data
        |> Map.get(:tools, [
          %{type: "file_search", file_search: %{max_num_results: 10}},
          %{
            type: "function",
            function: %{
              description: "Function description",
              name: "Function name",
              parameters: %{"key" => "value"}
            }
          },
          %{}
        ])
        |> Enum.map(&OpenAi.Mocks.Assistant.tool(&1)),
      top_p: 123,
      truncation_strategy:
        data |> Map.get(:truncation_strategy, %{}) |> OpenAi.Mocks.Truncation.object(),
      usage: data |> Map.get(:usage, %{}) |> completion_usage()
    })
  end

  def incomplete_details(data) do
    %{
      reason: "max_completion_tokens"
    }
    |> Map.merge(data)
  end

  def last_error(data) do
    %{
      code: "server_error",
      message: "error_message"
    }
    |> Map.merge(data)
  end

  def required_action(data) do
    %{
      type: "submit_tool_outputs",
      submit_tool_outputs: data |> Map.get(:submit_tool_outputs, %{}) |> submit_tool_outputs()
    }
    |> Map.merge(data)
  end

  def submit_tool_outputs(data) do
    %{
      tool_calls: data |> Map.get(:tool_calls, [%{}]) |> Enum.map(&tool_call(&1))
    }
  end

  def tool_call(data) do
    %{
      function: data |> Map.get(:function, %{}) |> tool_call_function(),
      id: "tc_abcd1234",
      type: "function"
    }
    |> Map.merge(data)
  end

  def tool_call_function(data) do
    %{
      arguments: "arguments",
      name: "tool_call_function"
    }
    |> Map.merge(data)
  end

  def completion_usage(data) do
    %{
      completion_count: 1,
      prompt_tokens: 1000,
      total_tokens: 1000
    }
    |> Map.merge(data)
  end

  def step(data) do
    %{
      assistant_id: "a_abcd1234",
      cancelled_at: 123_456,
      completed_at: 123_456,
      created_at: 123_456,
      expired_at: 123_456,
      failed_at: 123_456,
      id: "s_abcd1234",
      object: "thread.run.step",
      run_id: "r_abcd1234",
      status: "completed",
      thread_id: "t_abcd1234",
      type: "message_creation"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      last_error: data |> Map.get(:last_error, %{}) |> last_error(),
      metadata: data |> Map.get(:metadata, %{"key" => "value"}),
      step_details:
        data
        |> Map.get(:step_details, %{})
        |> step_details(),
      usage: data |> Map.get(:usage, %{}) |> completion_usage()
    })
  end

  def step_details(%{type: "tool_calls"} = data) do
    %{
      tool_calls: data |> Map.get(:message_creation, %{}) |> message_creation(),
      type: "message_creation"
    }
  end

  def step_details(data) do
    %{
      message_creation: data |> Map.get(:message_creation, %{}) |> message_creation(),
      type: "message_creation"
    }
  end

  def message_creation(data) do
    %{
      message_id: "m_abcd1234"
    }
    |> Map.merge(data)
  end
end
