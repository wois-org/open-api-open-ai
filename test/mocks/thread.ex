defmodule OpenAi.Mocks.Thread do
  def object(data) do
    %{
      id: "th_abc123",
      object: "thread",
      metadata: %{
        key: "value"
      },
      created_at: 1_699_061_776,
      updated_at: 1_699_061_776
    }
    |> Map.merge(data)
    |> Map.merge(%{
      tool_resources: data |> Map.get(:tool_resources, %{}) |> tool_resources()
    })
  end

  def tool_resources(data) do
    %{
      code_interpreter: data |> Map.get(:code_interpreter, %{}) |> code_interpreter(),
      file_search: data |> Map.get(:file_search, %{}) |> file_search()
    }
  end

  def code_interpreter(data) do
    %{
      file_ids: data |> Map.get(:file_ids, ["file_id", "file_id"])
    }
  end

  def file_search(data) do
    %{
      vector_store_ids: data |> Map.get(:vector_store_ids, ["vs_abc123", "vs_abc124"])
    }
  end

  def delete_response(data) do
    %{
      id: "th_abc123",
      object: "thread.deleted",
      deleted: true
    }
    |> Map.merge(data)
  end
end
