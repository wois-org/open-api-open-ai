defmodule OpenAi.FineTuning do
  @moduledoc """
  Provides API endpoints related to fine tuning
  """

  @default_client OpenAi.Client

  @doc """
  Immediately cancel a fine-tune job.

  """
  @spec cancel_fine_tuning_job(String.t(), keyword) :: {:ok, OpenAi.FineTuning.Job.t()} | :error
  def cancel_fine_tuning_job(fine_tuning_job_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [fine_tuning_job_id: fine_tuning_job_id],
      call: {OpenAi.FineTuning, :cancel_fine_tuning_job},
      url: "/fine_tuning/jobs/#{fine_tuning_job_id}/cancel",
      method: :post,
      response: [{200, {OpenAi.FineTuning.Job, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates a fine-tuning job which begins the process of creating a new model from a given dataset.

  Response includes details of the enqueued job including job status and the name of the fine-tuned models once complete.

  [Learn more about fine-tuning](/docs/guides/fine-tuning)

  """
  @spec create_fine_tuning_job(OpenAi.FineTuning.Job.CreateRequest.t(), keyword) ::
          {:ok, OpenAi.FineTuning.Job.t()} | :error
  def create_fine_tuning_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.FineTuning, :create_fine_tuning_job},
      url: "/fine_tuning/jobs",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.FineTuning.Job.CreateRequest, :t}}],
      response: [{200, {OpenAi.FineTuning.Job, :t}}],
      opts: opts
    })
  end

  @doc """
  Get status updates for a fine-tuning job.


  ## Options

    * `after`: Identifier for the last event from the previous pagination request.
    * `limit`: Number of events to retrieve.

  """
  @spec list_fine_tuning_events(String.t(), keyword) ::
          {:ok, OpenAi.FineTuning.Job.Event.ListResponse.t()} | :error
  def list_fine_tuning_events(fine_tuning_job_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit])

    client.request(%{
      args: [fine_tuning_job_id: fine_tuning_job_id],
      call: {OpenAi.FineTuning, :list_fine_tuning_events},
      url: "/fine_tuning/jobs/#{fine_tuning_job_id}/events",
      method: :get,
      query: query,
      response: [{200, {OpenAi.FineTuning.Job.Event.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  List checkpoints for a fine-tuning job.


  ## Options

    * `after`: Identifier for the last checkpoint ID from the previous pagination request.
    * `limit`: Number of checkpoints to retrieve.

  """
  @spec list_fine_tuning_job_checkpoints(String.t(), keyword) ::
          {:ok, OpenAi.FineTuning.Job.Checkpoint.ListResponse.t()} | :error
  def list_fine_tuning_job_checkpoints(fine_tuning_job_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit])

    client.request(%{
      args: [fine_tuning_job_id: fine_tuning_job_id],
      call: {OpenAi.FineTuning, :list_fine_tuning_job_checkpoints},
      url: "/fine_tuning/jobs/#{fine_tuning_job_id}/checkpoints",
      method: :get,
      query: query,
      response: [{200, {OpenAi.FineTuning.Job.Checkpoint.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  List your organization's fine-tuning jobs


  ## Options

    * `after`: Identifier for the last job from the previous pagination request.
    * `limit`: Number of fine-tuning jobs to retrieve.

  """
  @spec list_paginated_fine_tuning_jobs(keyword) ::
          {:ok, OpenAi.FineTuning.Job.ListResponse.t()} | :error
  def list_paginated_fine_tuning_jobs(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit])

    client.request(%{
      args: [],
      call: {OpenAi.FineTuning, :list_paginated_fine_tuning_jobs},
      url: "/fine_tuning/jobs",
      method: :get,
      query: query,
      response: [{200, {OpenAi.FineTuning.Job.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get info about a fine-tuning job.

  [Learn more about fine-tuning](/docs/guides/fine-tuning)

  """
  @spec retrieve_fine_tuning_job(String.t(), keyword) :: {:ok, OpenAi.FineTuning.Job.t()} | :error
  def retrieve_fine_tuning_job(fine_tuning_job_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [fine_tuning_job_id: fine_tuning_job_id],
      call: {OpenAi.FineTuning, :retrieve_fine_tuning_job},
      url: "/fine_tuning/jobs/#{fine_tuning_job_id}",
      method: :get,
      response: [{200, {OpenAi.FineTuning.Job, :t}}],
      opts: opts
    })
  end
end
