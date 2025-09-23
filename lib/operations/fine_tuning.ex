defmodule OpenAi.FineTuning do
  @moduledoc """
  Provides API endpoints related to fine tuning
  """

  @default_client OpenAi.Client

  @doc """
  Immediately cancel a fine-tune job.

  """
  @spec cancel_fine_tuning_job(fine_tuning_job_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.FineTuning.Job.t()} | {:error, OpenAi.Error.error()}
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
  **NOTE:** Calling this endpoint requires an [admin API key](../admin-api-keys).

  This enables organization owners to share fine-tuned models with other projects in their organization.

  """
  @spec create_fine_tuning_checkpoint_permission(
          fine_tuned_model_checkpoint :: String.t(),
          body :: OpenAi.FineTuning.CheckpointPermission.CreateRequest.t(),
          opts :: keyword
        ) ::
          {:ok, OpenAi.FineTuning.CheckpointPermission.ListResponse.t()}
          | {:error, OpenAi.Error.error()}
  def create_fine_tuning_checkpoint_permission(fine_tuned_model_checkpoint, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [fine_tuned_model_checkpoint: fine_tuned_model_checkpoint, body: body],
      call: {OpenAi.FineTuning, :create_fine_tuning_checkpoint_permission},
      url: "/fine_tuning/checkpoints/#{fine_tuned_model_checkpoint}/permissions",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.FineTuning.CheckpointPermission.CreateRequest, :t}}],
      response: [{200, {OpenAi.FineTuning.CheckpointPermission.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates a fine-tuning job which begins the process of creating a new model from a given dataset.

  Response includes details of the enqueued job including job status and the name of the fine-tuned models once complete.

  [Learn more about fine-tuning](/docs/guides/fine-tuning)

  """
  @spec create_fine_tuning_job(body :: OpenAi.FineTuning.Job.CreateRequest.t(), opts :: keyword) ::
          {:ok, OpenAi.FineTuning.Job.t()} | {:error, OpenAi.Error.error()}
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
  **NOTE:** This endpoint requires an [admin API key](../admin-api-keys).

  Organization owners can use this endpoint to delete a permission for a fine-tuned model checkpoint.

  """
  @spec delete_fine_tuning_checkpoint_permission(
          fine_tuned_model_checkpoint :: String.t(),
          permission_id :: String.t(),
          opts :: keyword
        ) ::
          {:ok, OpenAi.FineTuning.CheckpointPermission.DeleteResponse.t()}
          | {:error, OpenAi.Error.error()}
  def delete_fine_tuning_checkpoint_permission(
        fine_tuned_model_checkpoint,
        permission_id,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        fine_tuned_model_checkpoint: fine_tuned_model_checkpoint,
        permission_id: permission_id
      ],
      call: {OpenAi.FineTuning, :delete_fine_tuning_checkpoint_permission},
      url: "/fine_tuning/checkpoints/#{fine_tuned_model_checkpoint}/permissions/#{permission_id}",
      method: :delete,
      response: [{200, {OpenAi.FineTuning.CheckpointPermission.DeleteResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  **NOTE:** This endpoint requires an [admin API key](../admin-api-keys).

  Organization owners can use this endpoint to view all permissions for a fine-tuned model checkpoint.


  ## Options

    * `project_id`: The ID of the project to get permissions for.
    * `after`: Identifier for the last permission ID from the previous pagination request.
    * `limit`: Number of permissions to retrieve.
    * `order`: The order in which to retrieve permissions.

  """
  @spec list_fine_tuning_checkpoint_permissions(
          fine_tuned_model_checkpoint :: String.t(),
          opts :: keyword
        ) ::
          {:ok, OpenAi.FineTuning.CheckpointPermission.ListResponse.t()}
          | {:error, OpenAi.Error.error()}
  def list_fine_tuning_checkpoint_permissions(fine_tuned_model_checkpoint, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :order, :project_id])

    client.request(%{
      args: [fine_tuned_model_checkpoint: fine_tuned_model_checkpoint],
      call: {OpenAi.FineTuning, :list_fine_tuning_checkpoint_permissions},
      url: "/fine_tuning/checkpoints/#{fine_tuned_model_checkpoint}/permissions",
      method: :get,
      query: query,
      response: [{200, {OpenAi.FineTuning.CheckpointPermission.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get status updates for a fine-tuning job.


  ## Options

    * `after`: Identifier for the last event from the previous pagination request.
    * `limit`: Number of events to retrieve.

  """
  @spec list_fine_tuning_events(fine_tuning_job_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.FineTuning.Job.Event.ListResponse.t()} | {:error, OpenAi.Error.error()}
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
  @spec list_fine_tuning_job_checkpoints(fine_tuning_job_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.FineTuning.Job.Checkpoint.ListResponse.t()}
          | {:error, OpenAi.Error.error()}
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
    * `metadata`: Optional metadata filter. To filter, use the syntax `metadata[k]=v`. Alternatively, set `metadata=null` to indicate no metadata.
      

  """
  @spec list_paginated_fine_tuning_jobs(opts :: keyword) ::
          {:ok, OpenAi.FineTuning.Job.ListResponse.t()} | {:error, OpenAi.Error.error()}
  def list_paginated_fine_tuning_jobs(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :metadata])

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
  @spec retrieve_fine_tuning_job(fine_tuning_job_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.FineTuning.Job.t()} | {:error, OpenAi.Error.error()}
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
