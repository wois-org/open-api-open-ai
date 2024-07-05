defmodule Mocks.VectorStore do
  def vector_store(data) do
    %{
      id: "vs_abc123",
      object: "vector_store",
      created_at: 1_699_061_776,
      name: "Support FAQ",
      bytes: 139_920,
      file_counts: %{
        "in_progress" => 0,
        "completed" => 3,
        "failed" => 0,
        "cancelled" => 0,
        "total" => 3
      }
    }
    |> Map.merge(data)
  end

  def create(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> vector_store()
        |> Poison.encode!()
    }
  end

  def list(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        vector_store(data |> Enum.at(index - 1, %{}))
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
        |> vector_store()
        |> Poison.encode!()
    }
  end

  def update(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> vector_store()
        |> Poison.encode!()
    }
  end

  def delete(data \\ %{}) do
    vs = data |> vector_store()

    %HTTPoison.Response{
      status_code: 200,
      body:
        %{
          id: vs.id,
          object: "vector_store.deleted",
          deleted: true
        }
        |> Poison.encode!()
    }
  end
end
