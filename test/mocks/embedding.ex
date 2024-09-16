defmodule OpenAi.Mocks.Embedding do
  @moduledoc """
  Mocks for embedding related responses.
  """
  def embedding(data) do
    %{
      embedding: [0.1, 0.2, 0.3],
      index: 0,
      object: "embedding"
    }
    |> Map.merge(data)
  end

  def create_response(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        embedding(data |> Enum.at(index - 1, %{}))
      end)

    %HTTPoison.Response{
      status_code: 200,
      body:
        %{
          object: "list",
          data: data,
          model: "text-embedding-ada-002",
          usage: %{
            prompt_tokens: 123,
            total_tokens: 456
          }
        }
        |> embedding()
        |> Poison.encode!()
    }
  end
end
