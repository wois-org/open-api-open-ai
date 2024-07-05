defmodule Mocks.VectorStoreFile do
  def vector_store_file(data) do
    %{
      id: "vsf-abc123",
      object: "vector_store.file",
      created_at: 1_699_061_776,
      usage_bytes: 1234,
      vector_store_id: "vs_abcd",
      status: "completed",
      last_error: nil
    }
    |> Map.merge(data)
  end

  def create(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> vector_store_file()
        |> Poison.encode!()
    }
  end

  def list(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        vector_store_file(data |> Enum.at(index - 1, %{}))
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
        |> vector_store_file()
        |> Poison.encode!()
    }
  end

  def delete(data \\ %{}) do
    vsf = data |> vector_store_file()

    %HTTPoison.Response{
      status_code: 200,
      body:
        %{
          id: vsf.id,
          object: "vector_store.file",
          deleted: true
        }
        |> Poison.encode!()
    }
  end
end
