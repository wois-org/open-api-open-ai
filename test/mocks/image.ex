defmodule Mocks.Image do
  def image(data) do
    %{
      url: "https://api.openai.com/v1/images/ft:dall-e-2:acemeco:suffix:abc123",
      b64_json: nil,
      revised_prompt: nil
    }
    |> Map.merge(data)
  end

  def create(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        image(data |> Enum.at(index - 1, %{}))
      end)

    %HTTPoison.Response{
      status_code: 200,
      body:
        %{
          created: 163,
          data: data
        }
        |> Poison.encode!()
    }
  end
end
