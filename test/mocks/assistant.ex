defmodule OpenAi.Mocks.Assistant do
  @moduledoc """
  Mocks for Assistant schema
  """

  def object(data) do
    %{
      created_at: 123,
      description: "Assistant description",
      id: "a_abc1234",
      instructions: "Assistant instructions",
      metadata: %{"key" => "value"},
      model: "gpt-4",
      name: "Assistant name",
      object: "assistant",
      temperature: 0.5,
      top_p: 123
    }
    |> Map.merge(data)
    |> Map.merge(%{
      response_format: data |> Map.get(:response_format, %{}) |> response_format(),
      tool_resources: data |> Map.get(:tool_resources, %{}) |> tool_resources(),
      tools:
        data
        |> Map.get(:tools, [%{type: "file_search"}, %{type: "function"}, %{}])
        |> Enum.map(&tool(&1))
    })
  end

  def response_format(data) when data |> is_map do
    %{
      type: "text"
    }
    |> Map.merge(data)
  end

  def response_format(data) do
    data
  end

  def tool_resources(data) do
    %{
      code_interpreter:
        data |> Map.get(:code_interpreter, %{}) |> tool_resources_code_interpreter(),
      file_search: data |> Map.get(:file_search, %{}) |> tool_resources_file_search()
    }
  end

  def tool_resources_code_interpreter(data) do
    %{
      file_ids: data |> Map.get(:file_ids, ["file_id", "file_id"])
    }
  end

  def tool_resources_file_search(data) do
    %{
      vector_store_ids: data |> Map.get(:vector_store_ids, ["vs_abc123", "vs_abc124"])
    }
  end

  def tool_choice(data) do
    %{
      function: data |> Map.get(:function, %{}) |> tool_choice_function(),
      type: "function"
    }
    |> Map.merge(data)
  end

  def tool_choice_function(data) do
    %{
      name: "tool_choice_function"
    }
    |> Map.merge(data)
  end

  def tool(%{type: "file_search"} = data) do
    %{
      type: "file_search"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      file_search: data |> Map.get(:file_search, %{}) |> tool_file_search()
    })
  end

  def tool(%{type: "function"} = data) do
    %{
      type: "function"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      function: data |> Map.get(:function, %{}) |> OpenAi.Mocks.Function.object()
    })
  end

  def tool(data) do
    %{
      type: "code_interpreter"
    }
    |> Map.merge(data)
  end

  def tool_file_search(data) do
    %{
      max_num_results: 10
    }
    |> Map.merge(data)
  end

  def delete_response(data) do
    %{
      id: "a_abc1234",
      object: "assistant.deleted",
      deleted: true
    }
    |> Map.merge(data)
  end

  def cancel_run(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> OpenAi.Mocks.Run.object()
        |> Poison.encode!()
    }
  end

  def create(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> object()
        |> Poison.encode!()
    }
  end

  def message_create(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> OpenAi.Mocks.Message.object()
        |> Poison.encode!()
    }
  end

  def run_create(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> OpenAi.Mocks.Run.object()
        |> Poison.encode!()
    }
  end

  def thread_create(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> OpenAi.Mocks.Thread.object()
        |> Poison.encode!()
    }
  end

  def thread_create_and_run(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> OpenAi.Mocks.Run.object()
        |> Poison.encode!()
    }
  end

  def delete(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> delete_response()
        |> Poison.encode!()
    }
  end

  def delete_message(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> OpenAi.Mocks.Message.delete_response()
        |> Poison.encode!()
    }
  end

  def delete_thread(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> OpenAi.Mocks.Thread.delete_response()
        |> Poison.encode!()
    }
  end

  def get(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> object()
        |> Poison.encode!()
    }
  end

  def get_message(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> OpenAi.Mocks.Message.object()
        |> Poison.encode!()
    }
  end

  def get_run(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> OpenAi.Mocks.Run.object()
        |> Poison.encode!()
    }
  end

  def get_run_step(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> OpenAi.Mocks.Run.step()
        |> Poison.encode!()
    }
  end

  def get_thread(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> OpenAi.Mocks.Thread.object()
        |> Poison.encode!()
    }
  end

  def list(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        object(data |> Enum.at(index - 1, %{}))
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

  def list_messages(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        OpenAi.Mocks.Message.object(data |> Enum.at(index - 1, %{}))
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

  def list_run_steps(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        OpenAi.Mocks.Run.step(data |> Enum.at(index - 1, %{}))
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

  def list_runs(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        OpenAi.Mocks.Run.object(data |> Enum.at(index - 1, %{}))
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

  def update(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> object()
        |> Poison.encode!()
    }
  end

  def message_update(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> OpenAi.Mocks.Message.object()
        |> Poison.encode!()
    }
  end

  def run_update(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> OpenAi.Mocks.Run.object()
        |> Poison.encode!()
    }
  end

  def thread_update(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> OpenAi.Mocks.Thread.object()
        |> Poison.encode!()
    }
  end

  def submit_tool_outputs(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> OpenAi.Mocks.Run.object()
        |> Poison.encode!()
    }
  end
end
