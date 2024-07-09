defmodule OpenAi.Mocks.ChatCompletion do
  def chat_completion(data) do
    %{
      created: 123,
      id: "c_abc123",
      model: "text-davinci-003",
      object: "chat.completion",
      service_tier: "default",
      system_fingerprint: "fingerprint"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      choices: data |> Map.get(:choices, []) |> Enum.map(&chat_completion_choice(&1)),
      usage: data |> Map.get(:usage, %{}) |> OpenAi.Mocks.Completion.completion_usage()
    })
  end

  def chat_completion_choice(data) do
    %{
      finish_reason: "stop",
      index: 0,
      text: "response"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      logprobs: data |> Map.get(:logprobs, %{}) |> chat_completion_choice_logprobs(),
      message: data |> Map.get(:message, %{}) |> chat_completion_choice_message()
    })
  end

  def chat_completion_choice_logprobs(data) do
    count = 2

    content =
      Enum.map(1..count, fn index ->
        %{
          bytes: [0, 1, 2],
          logprob: 0.1,
          token: "token_#{index}",
          top_logprobs: [
            %{
              token: "token_#{index}",
              logprob: 0.1,
              bytes: [1, 2, 3]
            }
          ]
        }
        |> Map.merge(data |> Map.get(:content, []) |> Enum.at(index - 1, %{}))
      end)

    %{
      content: content
    }
  end

  def chat_completion_choice_message(data) do
    %{
      content: "choice message content",
      role: "assistant",
      tool_calls: [
        %{
          function: %{
            name: "tc_function_name",
            arguments: "tc_function_arguments"
          },
          id: "tc_abc123",
          type: "function"
        }
      ],
      function_call: %{
        name: "m_function_name",
        arguments: "m_function_arguments"
      }
    }
    |> Map.merge(data)
  end

  def create(data \\ %{}, choices_count \\ 2) do
    choices =
      Enum.map(1..choices_count, fn index ->
        chat_completion_choice(data |> Map.get(:choices, []) |> Enum.at(index - 1, %{}))
      end)

    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> Map.put(:choices, choices)
        |> chat_completion()
        |> Poison.encode!()
    }
  end
end
