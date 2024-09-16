defmodule OpenAi.Mocks.Model do
  @moduledoc """
  Mocks for model related responses.
  """
  def model(data) do
    %{
      id: "davinci",
      object: "model",
      created: 1_686_935_002,
      owned_by: "openai"
    }
    |> Map.merge(data)
  end

  def delete() do
    %HTTPoison.Response{
      status_code: 200,
      body:
        %{
          id: "ft:gpt-3.5-turbo:acemeco:suffix:abc123",
          deleted: true,
          object: "model"
        }
        |> Poison.encode!()
    }
  end

  def list(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        model(data |> Enum.at(index - 1, %{}))
      end)

    %HTTPoison.Response{
      status_code: 200,
      body:
        %{
          object: "list",
          data: data,
          first_id: data |> List.first() |> Map.get(:id),
          last_id: data |> List.last() |> Map.get(:id),
          has_more: false
        }
        |> Poison.encode!()
    }
  end

  def get(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> model()
        |> Poison.encode!()
    }
  end
end
