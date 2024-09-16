defmodule OpenAi.Mocks.RunStepDelta do
  @moduledoc """
  Mocks for run step delta related responses.
  """
  def object(data) do
    %{
      id: "run_123",
      object: "thread.run.step.delta"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      delta: data |> Map.get(:delta, %{}) |> delta()
    })
  end

  def delta(data) do
    %{
      step_details: data |> Map.get(:step_details, %{type: "tool_calls"}) |> step_detail()
    }
  end

  def step_detail(%{type: "message_creation"} = data), do: message_creation(data)
  def step_detail(%{type: "tool_calls"} = data), do: tool_calls(data)
  def step_detail(_data), do: nil

  def message_creation(data) do
    %{
      type: "message_creation"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      message_creation: data |> Map.get(:message_creation, %{message_id: "message_123"})
    })
  end

  def tool_calls(data) do
    %{
      type: "tool_calls"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      tool_calls:
        data |> Map.get(:tool_calls, [%{type: "code_interpreter"}]) |> Enum.map(&tool_call(&1))
    })
  end

  def tool_call(%{type: "code_interpreter"} = data) do
    %{
      index: 0,
      id: "call_123",
      type: "code_interpreter"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      code_interpreter: data |> Map.get(:code_interpreter, %{}) |> code_interpreter()
    })
  end

  def tool_call(%{type: "file_search"} = data) do
    %{
      index: 0,
      id: "call_123",
      type: "file_search",
      file_search: %{
        ranking_options: %{
          ranker: "default_2024_08_21",
          score_threshold: 0.0
        },
        results: []
      }
    }
    |> Map.merge(data)
  end

  def tool_call(%{type: "function"} = data) do
    %{
      index: 0,
      id: "call_123",
      type: "code_interpreter",
      function: %{
        arguments: "",
        name: "function_name"
      }
    }
    |> Map.merge(data)
  end

  def code_interpreter(data) do
    %{
      input: "hello_world"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      outputs:
        data |> Map.get(:outputs, [%{type: "logs"}]) |> Enum.map(&code_interpreter_output(&1))
    })
  end

  def code_interpreter_output(%{type: "image"} = data) do
    %{
      index: 0,
      type: "image"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      image: data |> Map.get(:image, %{}) |> code_interpreter_output_image()
    })
  end

  def code_interpreter_output(%{type: "logs"} = data) do
    %{
      index: 0,
      type: "logs",
      logs: "some logs"
    }
    |> Map.merge(data)
  end

  def code_interpreter_output_image(data) do
    %{
      file_id: "file_123"
    }
    |> Map.merge(data)
  end
end
