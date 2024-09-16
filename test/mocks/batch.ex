defmodule OpenAi.Mocks.Batch do
  @moduledoc """
  Mocks for batch related responses.
  """
  def batch(data) do
    %{
      cancelled_at: 123,
      cancelling_at: 123,
      completed_at: 123,
      completion_window: "completion_window",
      created_at: 123,
      endpoint: "endpoint",
      error_file_id: "error_file_id",
      expired_at: 123,
      expires_at: 123,
      failed_at: 123,
      finalizing_at: 123,
      id: "b_abc123",
      in_progress_at: 123,
      input_file_id: "input_file_id",
      metadata: %{},
      object: "batch",
      output_file_id: "output_file_id",
      status: "completed"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      errors: data |> Map.get(:errors, []) |> errors(),
      request_counts: data |> Map.get(:request_counts, %{}) |> request_counts()
    })
  end

  def errors(data) do
    %{
      data: data |> Enum.map(&error(&1)),
      object: "batch.errors"
    }
  end

  def error(data) do
    %{
      code: "error_code",
      line: 123,
      message: "error_message",
      param: "error_param"
    }
    |> Map.merge(data)
  end

  def request_counts(data) do
    %{
      completed: 123,
      failed: 123,
      total: 123
    }
    |> Map.merge(data)
  end

  def cancel(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> Map.put(:status, "cancelled")
        |> batch()
        |> Poison.encode!()
    }
  end

  def create(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> Map.put(:status, "validating")
        |> batch()
        |> Poison.encode!()
    }
  end

  def list(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        batch(data |> Enum.at(index - 1, %{}))
      end)

    %HTTPoison.Response{
      status_code: 200,
      body:
        %{
          data: data,
          object: "list",
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
        |> batch()
        |> Poison.encode!()
    }
  end
end
