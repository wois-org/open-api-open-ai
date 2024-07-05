defmodule Mocks.Message do
  def object(data) do
    %{
      assistant_id: "a_abc1234",
      completed_at: 123,
      created_at: 123,
      id: "m_abc1234",
      incomplete_at: 123,
      object: "thread.message",
      role: "user",
      run_id: "r_abc1234",
      status: "completed",
      thread_id: "t_abc1234"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      attachments: data |> Map.get(:attachments, [%{}]) |> Enum.map(&attachment(&1)),
      content:
        data
        |> Map.get(:content, [%{type: "image_file"}, %{type: "image_url"}, %{}])
        |> Enum.map(&content(&1)),
      incomplete_details: data |> Map.get(:incomplete_details, %{}) |> incomplete_details(),
      metadata: data |> Map.get(:metadata, %{"key" => "value"})
    })
  end

  def attachment(data) do
    %{
      file_id: "f_1234",
      tools: data |> Map.get(:tools, []) |> Enum.map(&Mocks.Assistant.tool(&1))
    }
    |> Map.merge(data)
  end

  def content(%{type: "image_file"} = data) do
    %{
      type: "file_search"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      image_file: data |> Map.get(:image_file, %{}) |> image_file()
    })
  end

  def content(%{type: "image_url"} = data) do
    %{
      type: "image_url"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      image_url: data |> Map.get(:image_url, %{}) |> image_url()
    })
  end

  def content(data) do
    %{
      type: "text"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      text: data |> Map.get(:text, %{}) |> content_text()
    })
  end

  def incomplete_details(data) do
    %{
      reason: "content_filter"
    }
    |> Map.merge(data)
  end

  def image_file(data) do
    %{
      file_id: "f_1234",
      detail: "auto"
    }
    |> Map.merge(data)
  end

  def image_url(data) do
    %{
      url: "https://example.com/image.jpg",
      detail: "auto"
    }
    |> Map.merge(data)
  end

  def content_text(data) do
    %{
      value: "content text"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      annotations:
        data
        |> Map.get(:annotations, [%{type: "file_citation"}, %{type: "file_path"}])
        |> Enum.map(&content_text_annotation(&1))
    })
  end

  def content_text_annotation(%{type: "file_citation"} = data) do
    %{
      end_index: 123,
      start_index: 123,
      text: "content file citation",
      type: "file_citation"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      file_citation:
        data |> Map.get(:file_citation, %{}) |> content_text_annotation_file_citation()
    })
  end

  def content_text_annotation(%{type: "file_path"} = data) do
    %{
      end_index: 123,
      start_index: 234,
      text: "content file path",
      type: "file_path"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      file_path: data |> Map.get(:file_path, %{}) |> content_text_annotation_file_path()
    })
  end

  def content_text_annotation_file_citation(data) do
    %{
      file_id: "f_1234"
    }
    |> Map.merge(data)
  end

  def content_text_annotation_file_path(data) do
    %{
      file_id: "f_1234"
    }
    |> Map.merge(data)
  end

  def delete_response(data) do
    %{
      id: "m_abc1234",
      object: "thread.message.deleted",
      deleted: true
    }
    |> Map.merge(data)
  end
end
