defmodule OpenAi.Assistants do
  @moduledoc """
  Provides API endpoints related to assistants
  """

  @default_client OpenAi.Client

  @doc """
  Cancels a run that is `in_progress`.
  """
  @spec cancel_run(thread_id :: String.t(), run_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Run.t()} | {:error, OpenAi.Error.error()}
  def cancel_run(thread_id, run_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id, run_id: run_id],
      call: {OpenAi.Assistants, :cancel_run},
      url: "/threads/#{thread_id}/runs/#{run_id}/cancel",
      method: :post,
      response: [{200, {OpenAi.Run, :t}}],
      opts: opts
    })
  end

  @doc """
  Create an assistant with a model and instructions.
  """
  @spec create_assistant(body :: OpenAi.Assistant.CreateRequest.t(), opts :: keyword) ::
          {:ok, OpenAi.Assistant.t()} | {:error, OpenAi.Error.error()}
  def create_assistant(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Assistants, :create_assistant},
      url: "/assistants",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Assistant.CreateRequest, :t}}],
      response: [{200, {OpenAi.Assistant, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a message.
  """
  @spec create_message(
          thread_id :: String.t(),
          body :: OpenAi.Message.CreateRequest.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Message.t()} | {:error, OpenAi.Error.error()}
  def create_message(thread_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id, body: body],
      call: {OpenAi.Assistants, :create_message},
      url: "/threads/#{thread_id}/messages",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Message.CreateRequest, :t}}],
      response: [{200, {OpenAi.Message, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a run.

  ## Options

    * `include[]`: A list of additional fields to include in the response. Currently the only supported value is `step_details.tool_calls[*].file_search.results[*].content` to fetch the file search result content.
      
      See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
      

  """
  @spec create_run(thread_id :: String.t(), body :: OpenAi.Run.CreateRequest.t(), opts :: keyword) ::
          {:ok, OpenAi.Run.t()} | {:error, OpenAi.Error.error()}
  def create_run(thread_id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"include[]"])

    client.request(%{
      args: [thread_id: thread_id, body: body],
      call: {OpenAi.Assistants, :create_run},
      url: "/threads/#{thread_id}/runs",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {OpenAi.Run.CreateRequest, :t}}],
      response: [{200, {OpenAi.Run, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a thread.
  """
  @spec create_thread(body :: OpenAi.Thread.CreateRequest.t(), opts :: keyword) ::
          {:ok, OpenAi.Thread.t()} | {:error, OpenAi.Error.error()}
  def create_thread(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Assistants, :create_thread},
      url: "/threads",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Thread.CreateRequest, :t}}],
      response: [{200, {OpenAi.Thread, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a thread and run it in one request.
  """
  @spec create_thread_and_run(body :: OpenAi.Thread.CreateAndRunRequest.t(), opts :: keyword) ::
          {:ok, OpenAi.Run.t()} | {:error, OpenAi.Error.error()}
  def create_thread_and_run(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Assistants, :create_thread_and_run},
      url: "/threads/runs",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Thread.CreateAndRunRequest, :t}}],
      response: [{200, {OpenAi.Run, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete an assistant.
  """
  @spec delete_assistant(assistant_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Assistant.DeleteResponse.t()} | {:error, OpenAi.Error.error()}
  def delete_assistant(assistant_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [assistant_id: assistant_id],
      call: {OpenAi.Assistants, :delete_assistant},
      url: "/assistants/#{assistant_id}",
      method: :delete,
      response: [{200, {OpenAi.Assistant.DeleteResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Deletes a message.
  """
  @spec delete_message(thread_id :: String.t(), message_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Message.DeleteResponse.t()} | {:error, OpenAi.Error.error()}
  def delete_message(thread_id, message_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id, message_id: message_id],
      call: {OpenAi.Assistants, :delete_message},
      url: "/threads/#{thread_id}/messages/#{message_id}",
      method: :delete,
      response: [{200, {OpenAi.Message.DeleteResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete a thread.
  """
  @spec delete_thread(thread_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Thread.DeleteResponse.t()} | {:error, OpenAi.Error.error()}
  def delete_thread(thread_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id],
      call: {OpenAi.Assistants, :delete_thread},
      url: "/threads/#{thread_id}",
      method: :delete,
      response: [{200, {OpenAi.Thread.DeleteResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves an assistant.
  """
  @spec get_assistant(assistant_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Assistant.t()} | {:error, OpenAi.Error.error()}
  def get_assistant(assistant_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [assistant_id: assistant_id],
      call: {OpenAi.Assistants, :get_assistant},
      url: "/assistants/#{assistant_id}",
      method: :get,
      response: [{200, {OpenAi.Assistant, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve a message.
  """
  @spec get_message(thread_id :: String.t(), message_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Message.t()} | {:error, OpenAi.Error.error()}
  def get_message(thread_id, message_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id, message_id: message_id],
      call: {OpenAi.Assistants, :get_message},
      url: "/threads/#{thread_id}/messages/#{message_id}",
      method: :get,
      response: [{200, {OpenAi.Message, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a run.
  """
  @spec get_run(thread_id :: String.t(), run_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Run.t()} | {:error, OpenAi.Error.error()}
  def get_run(thread_id, run_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id, run_id: run_id],
      call: {OpenAi.Assistants, :get_run},
      url: "/threads/#{thread_id}/runs/#{run_id}",
      method: :get,
      response: [{200, {OpenAi.Run, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a run step.

  ## Options

    * `include[]`: A list of additional fields to include in the response. Currently the only supported value is `step_details.tool_calls[*].file_search.results[*].content` to fetch the file search result content.
      
      See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
      

  """
  @spec get_run_step(
          thread_id :: String.t(),
          run_id :: String.t(),
          step_id :: String.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Run.Step.t()} | {:error, OpenAi.Error.error()}
  def get_run_step(thread_id, run_id, step_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"include[]"])

    client.request(%{
      args: [thread_id: thread_id, run_id: run_id, step_id: step_id],
      call: {OpenAi.Assistants, :get_run_step},
      url: "/threads/#{thread_id}/runs/#{run_id}/steps/#{step_id}",
      method: :get,
      query: query,
      response: [{200, {OpenAi.Run.Step, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a thread.
  """
  @spec get_thread(thread_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Thread.t()} | {:error, OpenAi.Error.error()}
  def get_thread(thread_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id],
      call: {OpenAi.Assistants, :get_thread},
      url: "/threads/#{thread_id}",
      method: :get,
      response: [{200, {OpenAi.Thread, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of assistants.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `order`: Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      
    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
      

  """
  @spec list_assistants(opts :: keyword) ::
          {:ok, OpenAi.Assistant.ListResponse.t()} | {:error, OpenAi.Error.error()}
  def list_assistants(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit, :order])

    client.request(%{
      args: [],
      call: {OpenAi.Assistants, :list_assistants},
      url: "/assistants",
      method: :get,
      query: query,
      response: [{200, {OpenAi.Assistant.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of messages for a given thread.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `order`: Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      
    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
      
    * `run_id`: Filter messages by the run ID that generated them.
      

  """
  @spec list_messages(thread_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Message.ListResponse.t()} | {:error, OpenAi.Error.error()}
  def list_messages(thread_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit, :order, :run_id])

    client.request(%{
      args: [thread_id: thread_id],
      call: {OpenAi.Assistants, :list_messages},
      url: "/threads/#{thread_id}/messages",
      method: :get,
      query: query,
      response: [{200, {OpenAi.Message.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of run steps belonging to a run.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `order`: Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      
    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
      
    * `include[]`: A list of additional fields to include in the response. Currently the only supported value is `step_details.tool_calls[*].file_search.results[*].content` to fetch the file search result content.
      
      See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.
      

  """
  @spec list_run_steps(thread_id :: String.t(), run_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Run.Step.ListResponse.t()} | {:error, OpenAi.Error.error()}
  def list_run_steps(thread_id, run_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :"include[]", :limit, :order])

    client.request(%{
      args: [thread_id: thread_id, run_id: run_id],
      call: {OpenAi.Assistants, :list_run_steps},
      url: "/threads/#{thread_id}/runs/#{run_id}/steps",
      method: :get,
      query: query,
      response: [{200, {OpenAi.Run.Step.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of runs belonging to a thread.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `order`: Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      
    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
      

  """
  @spec list_runs(thread_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Run.ListResponse.t()} | {:error, OpenAi.Error.error()}
  def list_runs(thread_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit, :order])

    client.request(%{
      args: [thread_id: thread_id],
      call: {OpenAi.Assistants, :list_runs},
      url: "/threads/#{thread_id}/runs",
      method: :get,
      query: query,
      response: [{200, {OpenAi.Run.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Modifies an assistant.
  """
  @spec modify_assistant(
          assistant_id :: String.t(),
          body :: OpenAi.Assistant.UpdateRequest.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Assistant.t()} | {:error, OpenAi.Error.error()}
  def modify_assistant(assistant_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [assistant_id: assistant_id, body: body],
      call: {OpenAi.Assistants, :modify_assistant},
      url: "/assistants/#{assistant_id}",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Assistant.UpdateRequest, :t}}],
      response: [{200, {OpenAi.Assistant, :t}}],
      opts: opts
    })
  end

  @doc """
  Modifies a message.
  """
  @spec modify_message(
          thread_id :: String.t(),
          message_id :: String.t(),
          body :: OpenAi.Message.UpdateRequest.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Message.t()} | {:error, OpenAi.Error.error()}
  def modify_message(thread_id, message_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id, message_id: message_id, body: body],
      call: {OpenAi.Assistants, :modify_message},
      url: "/threads/#{thread_id}/messages/#{message_id}",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Message.UpdateRequest, :t}}],
      response: [{200, {OpenAi.Message, :t}}],
      opts: opts
    })
  end

  @doc """
  Modifies a run.
  """
  @spec modify_run(
          thread_id :: String.t(),
          run_id :: String.t(),
          body :: OpenAi.Run.UpdateRequest.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Run.t()} | {:error, OpenAi.Error.error()}
  def modify_run(thread_id, run_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id, run_id: run_id, body: body],
      call: {OpenAi.Assistants, :modify_run},
      url: "/threads/#{thread_id}/runs/#{run_id}",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Run.UpdateRequest, :t}}],
      response: [{200, {OpenAi.Run, :t}}],
      opts: opts
    })
  end

  @doc """
  Modifies a thread.
  """
  @spec modify_thread(
          thread_id :: String.t(),
          body :: OpenAi.Thread.UpdateRequest.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Thread.t()} | {:error, OpenAi.Error.error()}
  def modify_thread(thread_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id, body: body],
      call: {OpenAi.Assistants, :modify_thread},
      url: "/threads/#{thread_id}",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Thread.UpdateRequest, :t}}],
      response: [{200, {OpenAi.Thread, :t}}],
      opts: opts
    })
  end

  @doc """
  When a run has the `status: "requires_action"` and `required_action.type` is `submit_tool_outputs`, this endpoint can be used to submit the outputs from the tool calls once they're all completed. All outputs must be submitted in a single request.

  """
  @spec submit_tool_outputs_to_run(
          thread_id :: String.t(),
          run_id :: String.t(),
          body :: OpenAi.Assistant.Tool.Outputs.RunSubmitRequest.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Run.t()} | {:error, OpenAi.Error.error()}
  def submit_tool_outputs_to_run(thread_id, run_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id, run_id: run_id, body: body],
      call: {OpenAi.Assistants, :submit_tool_outputs_to_run},
      url: "/threads/#{thread_id}/runs/#{run_id}/submit_tool_outputs",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Assistant.Tool.Outputs.RunSubmitRequest, :t}}],
      response: [{200, {OpenAi.Run, :t}}],
      opts: opts
    })
  end
end
