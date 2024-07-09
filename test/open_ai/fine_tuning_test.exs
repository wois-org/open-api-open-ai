defmodule OpenAi.FineTuningTest do
  use ExUnit.Case
  import Mox

  alias OpenAi.FineTuning

  describe "cancel_fine_tuning_job/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post

        assert request.url ==
                 "https://api.openai.com/v1/fine_tuning/jobs/ft:acemeco:suffix:abc123/cancel"

        {:ok, OpenAi.Mocks.FineTuning.cancel_job()}
      end)

      {:ok, response} = FineTuning.cancel_fine_tuning_job("ft:acemeco:suffix:abc123")

      assert %FineTuning.Job{
               id: "ft:acemeco:suffix:abc123",
               status: "cancelled"
             } = response
    end
  end

  describe "create_fine_tuning_job/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post

        assert %{
                 "hyperparameters" => %{
                   "batch_size" => "auto",
                   "learning_rate_multiplier" => 1.0,
                   "n_epochs" => "auto"
                 },
                 "integrations" => "babbage-002",
                 "model" => "davinci-002",
                 "seed" => 1,
                 "suffix" => "abc123",
                 "training_file" => "@train.json",
                 "validation_file" => "@validate.json"
               } = Poison.decode!(request.body)

        assert request.url ==
                 "https://api.openai.com/v1/fine_tuning/jobs"

        {:ok, OpenAi.Mocks.FineTuning.create_job()}
      end)

      {:ok, response} =
        %FineTuning.Job.CreateRequest{
          hyperparameters: %FineTuning.Job.CreateRequest.Hyperparameters{
            batch_size: "auto",
            learning_rate_multiplier: 1.0,
            n_epochs: "auto"
          },
          integrations: "babbage-002",
          model: "davinci-002",
          seed: 1,
          suffix: "abc123",
          training_file: "@train.json",
          validation_file: "@validate.json"
        }
        |> FineTuning.create_fine_tuning_job()

      assert %FineTuning.Job{
               id: "ft:acemeco:suffix:abc123",
               status: "queued"
             } = response
    end
  end

  describe "list_fine_tuning_events/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get

        assert request.url ==
                 "https://api.openai.com/v1/fine_tuning/jobs/ft:acemeco:suffix:abc123/events"

        {:ok, OpenAi.Mocks.FineTuning.list_job_events()}
      end)

      {:ok, response} = FineTuning.list_fine_tuning_events("ft:acemeco:suffix:abc123")

      assert %FineTuning.Job.Event.ListResponse{
               data: [
                 %FineTuning.Job.Event{
                   created_at: 1_692_407_401,
                   id: "fte:acemeco:suffix:abc123",
                   level: "info",
                   message: "Fine tuning job successfully completed",
                   object: "fine_tuning.job.event"
                 },
                 %FineTuning.Job.Event{
                   created_at: 1_692_407_401,
                   id: "fte:acemeco:suffix:abc123",
                   level: "info",
                   message: "Fine tuning job successfully completed",
                   object: "fine_tuning.job.event"
                 }
               ],
               object: "list"
             } = response
    end
  end

  describe "list_fine_tuning_job_checkpoints/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get

        assert request.url ==
                 "https://api.openai.com/v1/fine_tuning/jobs/ft:acemeco:suffix:abc123/checkpoints"

        {:ok,
         OpenAi.Mocks.FineTuning.list_job_checkpoints([
           %{id: "ftc:acemeco:suffix:abc123", step_number: 1},
           %{id: "ftc:acemeco:suffix:abc124", step_number: 2}
         ])}
      end)

      {:ok, response} = FineTuning.list_fine_tuning_job_checkpoints("ft:acemeco:suffix:abc123")

      assert %FineTuning.Job.Checkpoint.ListResponse{
               data: [
                 %FineTuning.Job.Checkpoint{
                   id: "ftc:acemeco:suffix:abc123",
                   object: "fine_tuning.job.checkpoint",
                   created_at: 1_692_407_401,
                   fine_tuned_model_checkpoint: "ftc:acemeco:suffix:abc123",
                   fine_tuning_job_id: "ft:acemeco:suffix:abc123",
                   metrics: %FineTuning.Job.Checkpoint.Metrics{
                     full_valid_loss: 0.1,
                     full_valid_mean_token_accuracy: 0.9,
                     step: 1,
                     train_loss: 0.1,
                     train_mean_token_accuracy: 0.9,
                     valid_loss: 0.1,
                     valid_mean_token_accuracy: 0.9
                   },
                   step_number: 1
                 },
                 %FineTuning.Job.Checkpoint{
                   id: "ftc:acemeco:suffix:abc124",
                   object: "fine_tuning.job.checkpoint",
                   created_at: 1_692_407_401,
                   fine_tuned_model_checkpoint: "ftc:acemeco:suffix:abc123",
                   fine_tuning_job_id: "ft:acemeco:suffix:abc123",
                   metrics: %FineTuning.Job.Checkpoint.Metrics{
                     full_valid_loss: 0.1,
                     full_valid_mean_token_accuracy: 0.9,
                     step: 1,
                     train_loss: 0.1,
                     train_mean_token_accuracy: 0.9,
                     valid_loss: 0.1,
                     valid_mean_token_accuracy: 0.9
                   },
                   step_number: 2
                 }
               ],
               object: "list",
               first_id: "ftc:acemeco:suffix:abc123",
               has_more: false,
               last_id: "ftc:acemeco:suffix:abc124"
             } = response
    end
  end

  describe "list_paginated_fine_tuning_jobs/0" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get

        assert request.url ==
                 "https://api.openai.com/v1/fine_tuning/jobs"

        {:ok,
         OpenAi.Mocks.FineTuning.list_jobs([
           %{id: "ft:acemeco:suffix:abc123", status: "queued"},
           %{id: "ft:acemeco:suffix:abc124", status: "queued"}
         ])}
      end)

      {:ok, response} = FineTuning.list_paginated_fine_tuning_jobs()

      assert %FineTuning.Job.ListResponse{
               data: [
                 %FineTuning.Job{
                   id: "ft:acemeco:suffix:abc123",
                   status: "queued"
                 },
                 %FineTuning.Job{
                   id: "ft:acemeco:suffix:abc124",
                   status: "queued"
                 }
               ],
               object: "list",
               has_more: false
             } = response
    end
  end

  describe "retrieve_fine_tuning_job/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get

        assert request.url ==
                 "https://api.openai.com/v1/fine_tuning/jobs/ft:acemeco:suffix:abc123"

        {:ok, OpenAi.Mocks.FineTuning.get_job()}
      end)

      {:ok, response} = FineTuning.retrieve_fine_tuning_job("ft:acemeco:suffix:abc123")

      assert %FineTuning.Job{
               id: "ft:acemeco:suffix:abc123",
               status: "running"
             } = response
    end
  end
end
