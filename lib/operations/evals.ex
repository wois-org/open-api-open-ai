defmodule OpenAi.Evals do
  @moduledoc """
  Provides API endpoints related to evals
  """

  @default_client OpenAi.Client

  @doc """
  Cancel an ongoing evaluation run.

  """
  @spec cancel_eval_run(eval_id :: String.t(), run_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Eval.Run.t()} | {:error, OpenAi.Error.error()}
  def cancel_eval_run(eval_id, run_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [eval_id: eval_id, run_id: run_id],
      call: {OpenAi.Evals, :cancel_eval_run},
      url: "/evals/#{eval_id}/runs/#{run_id}",
      method: :post,
      response: [{200, {OpenAi.Eval.Run, :t}}],
      opts: opts
    })
  end

  @doc """
  Create the structure of an evaluation that can be used to test a model's performance.
  An evaluation is a set of testing criteria and a datasource. After creating an evaluation, you can run it on different models and model parameters. We support several types of graders and datasources.
  For more information, see the [Evals guide](/docs/guides/evals).

  """
  @spec create_eval(body :: OpenAi.Eval.RequestCreate.t(), opts :: keyword) ::
          {:ok, OpenAi.Eval.t()} | {:error, OpenAi.Error.error()}
  def create_eval(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Evals, :create_eval},
      url: "/evals",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Eval.RequestCreate, :t}}],
      response: [{201, {OpenAi.Eval, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a new evaluation run. This is the endpoint that will kick off grading.

  """
  @spec create_eval_run(
          eval_id :: String.t(),
          body :: OpenAi.Eval.Run.CreateRequest.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Eval.Run.t()} | {:error, OpenAi.Error.error()}
  def create_eval_run(eval_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [eval_id: eval_id, body: body],
      call: {OpenAi.Evals, :create_eval_run},
      url: "/evals/#{eval_id}/runs",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Eval.Run.CreateRequest, :t}}],
      response: [{201, {OpenAi.Eval.Run, :t}}, {400, {OpenAi.ResError, :t}}],
      opts: opts
    })
  end

  @type delete_eval_200_json_resp :: %{deleted: boolean, eval_id: String.t(), object: String.t()}

  @doc """
  Delete an evaluation.

  """
  @spec delete_eval(eval_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Evals.delete_eval_200_json_resp()} | {:error, OpenAi.Error.error()}
  def delete_eval(eval_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [eval_id: eval_id],
      call: {OpenAi.Evals, :delete_eval},
      url: "/evals/#{eval_id}",
      method: :delete,
      response: [{200, {OpenAi.Evals, :delete_eval_200_json_resp}}, {404, {OpenAi.ResError, :t}}],
      opts: opts
    })
  end

  @type delete_eval_run_200_json_resp :: %{
          deleted: boolean | nil,
          object: String.t() | nil,
          run_id: String.t() | nil
        }

  @doc """
  Delete an eval run.

  """
  @spec delete_eval_run(eval_id :: String.t(), run_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Evals.delete_eval_run_200_json_resp()} | {:error, OpenAi.Error.error()}
  def delete_eval_run(eval_id, run_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [eval_id: eval_id, run_id: run_id],
      call: {OpenAi.Evals, :delete_eval_run},
      url: "/evals/#{eval_id}/runs/#{run_id}",
      method: :delete,
      response: [
        {200, {OpenAi.Evals, :delete_eval_run_200_json_resp}},
        {404, {OpenAi.ResError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get an evaluation by ID.

  """
  @spec get_eval(eval_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Eval.t()} | {:error, OpenAi.Error.error()}
  def get_eval(eval_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [eval_id: eval_id],
      call: {OpenAi.Evals, :get_eval},
      url: "/evals/#{eval_id}",
      method: :get,
      response: [{200, {OpenAi.Eval, :t}}],
      opts: opts
    })
  end

  @doc """
  Get an evaluation run by ID.

  """
  @spec get_eval_run(eval_id :: String.t(), run_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Eval.Run.t()} | {:error, OpenAi.Error.error()}
  def get_eval_run(eval_id, run_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [eval_id: eval_id, run_id: run_id],
      call: {OpenAi.Evals, :get_eval_run},
      url: "/evals/#{eval_id}/runs/#{run_id}",
      method: :get,
      response: [{200, {OpenAi.Eval.Run, :t}}],
      opts: opts
    })
  end

  @doc """
  Get an evaluation run output item by ID.

  """
  @spec get_eval_run_output_item(
          eval_id :: String.t(),
          run_id :: String.t(),
          output_item_id :: String.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Eval.Run.OutputItem.t()} | {:error, OpenAi.Error.error()}
  def get_eval_run_output_item(eval_id, run_id, output_item_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [eval_id: eval_id, run_id: run_id, output_item_id: output_item_id],
      call: {OpenAi.Evals, :get_eval_run_output_item},
      url: "/evals/#{eval_id}/runs/#{run_id}/output_items/#{output_item_id}",
      method: :get,
      response: [{200, {OpenAi.Eval.Run.OutputItem, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a list of output items for an evaluation run.


  ## Options

    * `after`: Identifier for the last output item from the previous pagination request.
    * `limit`: Number of output items to retrieve.
    * `status`: Filter output items by status. Use `failed` to filter by failed output
      items or `pass` to filter by passed output items.
      
    * `order`: Sort order for output items by timestamp. Use `asc` for ascending order or `desc` for descending order. Defaults to `asc`.

  """
  @spec get_eval_run_output_items(eval_id :: String.t(), run_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Eval.Run.OutputItem.List.t()} | {:error, OpenAi.Error.error()}
  def get_eval_run_output_items(eval_id, run_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :order, :status])

    client.request(%{
      args: [eval_id: eval_id, run_id: run_id],
      call: {OpenAi.Evals, :get_eval_run_output_items},
      url: "/evals/#{eval_id}/runs/#{run_id}/output_items",
      method: :get,
      query: query,
      response: [{200, {OpenAi.Eval.Run.OutputItem.List, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a list of runs for an evaluation.


  ## Options

    * `after`: Identifier for the last run from the previous pagination request.
    * `limit`: Number of runs to retrieve.
    * `order`: Sort order for runs by timestamp. Use `asc` for ascending order or `desc` for descending order. Defaults to `asc`.
    * `status`: Filter runs by status. One of `queued` | `in_progress` | `failed` | `completed` | `canceled`.

  """
  @spec get_eval_runs(eval_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Eval.Run.List.t()} | {:error, OpenAi.Error.error()}
  def get_eval_runs(eval_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :order, :status])

    client.request(%{
      args: [eval_id: eval_id],
      call: {OpenAi.Evals, :get_eval_runs},
      url: "/evals/#{eval_id}/runs",
      method: :get,
      query: query,
      response: [{200, {OpenAi.Eval.Run.List, :t}}],
      opts: opts
    })
  end

  @doc """
  List evaluations for a project.


  ## Options

    * `after`: Identifier for the last eval from the previous pagination request.
    * `limit`: Number of evals to retrieve.
    * `order`: Sort order for evals by timestamp. Use `asc` for ascending order or `desc` for descending order.
    * `order_by`: Evals can be ordered by creation time or last updated time. Use
      `created_at` for creation time or `updated_at` for last updated time.
      

  """
  @spec list_evals(opts :: keyword) ::
          {:ok, OpenAi.Eval.List.t()} | {:error, OpenAi.Error.error()}
  def list_evals(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :order, :order_by])

    client.request(%{
      args: [],
      call: {OpenAi.Evals, :list_evals},
      url: "/evals",
      method: :get,
      query: query,
      response: [{200, {OpenAi.Eval.List, :t}}],
      opts: opts
    })
  end

  @doc """
  Update certain properties of an evaluation.

  """
  @spec update_eval(eval_id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenAi.Eval.t()} | {:error, OpenAi.Error.error()}
  def update_eval(eval_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [eval_id: eval_id, body: body],
      call: {OpenAi.Evals, :update_eval},
      url: "/evals/#{eval_id}",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {OpenAi.Eval, :t}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:delete_eval_200_json_resp) do
    [deleted: :boolean, eval_id: {:string, :generic}, object: {:string, :generic}]
  end

  def __fields__(:delete_eval_run_200_json_resp) do
    [deleted: :boolean, object: {:string, :generic}, run_id: {:string, :generic}]
  end
end
