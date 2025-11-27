defmodule OpenAi.Mocks.Responses do
  @moduledoc """
  Mocks for "Responses" API
  """
  alias OpenAi.Mocks.Response

  def create_response(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> Response.object()
        |> Poison.encode!()
    }
  end

  def delete_response(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        %{
          id: "resp_6786a1bec27481909a17d673315b29f6",
          object: "response.deleted",
          deleted: true
        }
        |> Map.merge(data)
        |> Poison.encode!()
    }
  end

  def get_response(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> Response.object()
        |> Poison.encode!()
    }
  end

  def list_input_items(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        Response.object(data |> Enum.at(index - 1, %{}))
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
end
