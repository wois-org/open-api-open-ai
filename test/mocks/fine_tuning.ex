defmodule OpenAi.Mocks.FineTuning do
  @moduledoc """
  Mocks for fine tuning related responses.
  """
  def job(data) do
    %{
      created_at: 163,
      error: nil,
      estimated_finish: nil,
      fine_tuned_model: nil,
      finished_at: nil,
      id: "ft:acemeco:suffix:abc123",
      integrations: nil,
      model: "davinci-codex",
      object: "fine_tuning.job",
      organization_id: "acemeco",
      result_files: ["ft:acemeco:suffix:abc123"],
      seed: 1,
      status: "running",
      trained_tokens: nil,
      training_file: "ft:acemeco:suffix:abc123",
      validation_file: nil
    }
    |> Map.merge(data)
    |> Map.merge(%{
      hyperparameters: data |> Map.get(:hyperparameters, %{}) |> hyperparameters()
    })
  end

  def hyperparameters(data) do
    %{
      batch_size: 1,
      dataset: "ft:acemeco:suffix:abc123",
      epochs: 1,
      learning_rate: 1.0,
      max_tokens: 1,
      model: "davinci-codex",
      prompt: "This is a test prompt",
      run_name: "ft:acemeco:suffix:abc123",
      validation_split: 0.1
    }
    |> Map.merge(data)
  end

  def job_event(data) do
    %{
      object: "fine_tuning.job.event",
      id: "fte:acemeco:suffix:abc123",
      created_at: 1_692_407_401,
      level: "info",
      message: "Fine tuning job successfully completed"
    }
    |> Map.merge(data)
  end

  def job_checkpoint(data) do
    %{
      created_at: 1_692_407_401,
      fine_tuned_model_checkpoint: "ftc:acemeco:suffix:abc123",
      fine_tuning_job_id: "ft:acemeco:suffix:abc123",
      id: "ftc:acemeco:suffix:abc123",
      object: "fine_tuning.job.checkpoint",
      step_number: 1
    }
    |> Map.merge(data)
    |> Map.merge(%{
      metrics: data |> Map.get(:metrics, %{}) |> job_checkpoint_metrics()
    })
  end

  def job_checkpoint_metrics(data) do
    %{
      full_valid_loss: 0.1,
      full_valid_mean_token_accuracy: 0.9,
      step: 1,
      train_loss: 0.1,
      train_mean_token_accuracy: 0.9,
      valid_loss: 0.1,
      valid_mean_token_accuracy: 0.9
    }
    |> Map.merge(data)
  end

  def cancel_job(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> Map.put(:status, "cancelled")
        |> job()
        |> Poison.encode!()
    }
  end

  def create_job(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> Map.put(:status, "queued")
        |> job()
        |> Poison.encode!()
    }
  end

  def list_job_events(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        job_event(data |> Enum.at(index - 1, %{}))
      end)

    %HTTPoison.Response{
      status_code: 200,
      body:
        %{
          data: data,
          object: "list",
          has_more: false
        }
        |> Poison.encode!()
    }
  end

  def list_job_checkpoints(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        job_checkpoint(data |> Enum.at(index - 1, %{}))
      end)

    %HTTPoison.Response{
      status_code: 200,
      body:
        %{
          data: data,
          object: "list",
          has_more: false,
          first_id: data |> List.first() |> Map.get(:id),
          last_id: data |> List.last() |> Map.get(:id)
        }
        |> Poison.encode!()
    }
  end

  def list_jobs(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        job(data |> Enum.at(index - 1, %{}))
      end)

    %HTTPoison.Response{
      status_code: 200,
      body:
        %{
          data: data,
          object: "list",
          has_more: false,
          first_id: data |> List.first() |> Map.get(:id),
          last_id: data |> List.last() |> Map.get(:id)
        }
        |> Poison.encode!()
    }
  end

  def get_job(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> job()
        |> Poison.encode!()
    }
  end
end
