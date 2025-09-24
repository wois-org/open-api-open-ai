defmodule OpenAi.Mocks.VectorStoreFileBatch do
  @moduledoc """
  Mocks for vector store file batch related responses.
  """
  def vector_store_file_batch(data) do
    %{
      id: "vsfb_abc123",
      object: "vector_store.file_batch",
      created_at: 1_699_061_776,
      vector_store_id: "vs_abc123",
      status: "in_progress",
      file_counts: %{
        in_progress: 1,
        completed: 1,
        failed: 0,
        cancelled: 0,
        total: 0
      }
    }
    |> Map.merge(data)
  end

  def create(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> vector_store_file_batch()
        |> Poison.encode!()
    }
  end

  def get(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> vector_store_file_batch()
        |> Poison.encode!()
    }
  end

  def list(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        vector_store_file_batch(data |> Enum.at(index - 1, %{}))
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

  def cancel(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> vector_store_file_batch()
        |> Poison.encode!()
    }
  end
end
