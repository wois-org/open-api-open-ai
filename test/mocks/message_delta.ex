defmodule OpenAi.Mocks.MessageDelta do
  @moduledoc """
  Mocks for message delta related responses.
  """
  def object(data) do
    %{
      id: "msg_123",
      object: "thread.message.delta"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      delta: data |> Map.get(:delta, %{}) |> delta()
    })
  end

  def delta(data) do
    %{
      content: data |> Map.get(:content, [%{}]) |> Enum.map(&content(&1))
    }
  end

  def content(data) do
    %{
      index: 0,
      type: "text",
      text: data |> Map.get(:text, %{}) |> content_text()
    }
  end

  def content_text(data) do
    %{
      value: "Hello",
      annotations: []
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
      file_id: "f_1234",
      quote: "content file citation"
    }
    |> Map.merge(data)
  end

  def content_text_annotation_file_path(data) do
    %{
      file_id: "f_1234"
    }
    |> Map.merge(data)
  end
end
