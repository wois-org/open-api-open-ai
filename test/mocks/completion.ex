defmodule OpenAi.Mocks.Completion do
  def completion(data) do
    %{
      created: 123,
      id: "c_abc123",
      model: "text-davinci-003",
      object: "text_completion",
      system_fingerprint: "fingerprint"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      choices: data |> Map.get(:choices, []) |> Enum.map(&completion_choice(&1)),
      usage: data |> Map.get(:usage, %{}) |> completion_usage()
    })
  end

  def completion_choice(data) do
    %{
      finish_reason: "length",
      index: 0,
      model: "text-davinci-003",
      object: "text_completion",
      text: "response"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      logprobs: data |> Map.get(:logprobs, %{}) |> completion_choice_logprobs()
    })
  end

  def completion_choice_logprobs(data) do
    %{
      text_offset: [0, 1, 2],
      token_logprobs: [0.1, 0.2, 0.3],
      tokens: ["token1", "token2", "token3"]
    }
    |> Map.merge(data)
  end

  def completion_usage(data) do
    %{
      completion_tokens: 232,
      prompt_tokens: 123,
      total_tokens: 456
    }
    |> Map.merge(data)
  end

  def create(data \\ %{}, choices_count \\ 2) do
    choices =
      Enum.map(1..choices_count, fn index ->
        completion_choice(data |> Map.get(:choices, []) |> Enum.at(index - 1, %{}))
      end)

    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> Map.put(:choices, choices)
        |> completion()
        |> Poison.encode!()
    }
  end
end
