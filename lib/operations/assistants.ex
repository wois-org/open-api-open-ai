defmodule OpenAi.Assistants do
  @moduledoc """
  Provides API endpoints related to assistants
  """

  @default_client OpenAi.Client

  @doc """
  Cancels a run that is `in_progress`.
  """
  @spec cancel_run(String.t(), String.t(), keyword) :: {:ok, OpenAi.Run.t()} | :error
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
  @spec create_assistant(OpenAi.Assistant.CreateRequest.t(), keyword) ::
          {:ok, OpenAi.Assistant.t()} | :error
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
  @spec create_message(String.t(), OpenAi.Message.CreateRequest.t(), keyword) ::
          {:ok, OpenAi.Message.t()} | :error
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
  """
  @spec create_run(String.t(), OpenAi.Run.CreateRequest.t(), keyword) ::
          {:ok, OpenAi.Run.t()} | :error
  def create_run(thread_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id, body: body],
      call: {OpenAi.Assistants, :create_run},
      url: "/threads/#{thread_id}/runs",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Run.CreateRequest, :t}}],
      response: [{200, {OpenAi.Run, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a thread.
  """
  @spec create_thread(OpenAi.Thread.CreateRequest.t(), keyword) ::
          {:ok, OpenAi.Thread.t()} | :error
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
  @spec create_thread_and_run(OpenAi.Thread.CreateAndRunRequest.t(), keyword) ::
          {:ok, OpenAi.Run.t()} | :error
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
  @spec delete_assistant(String.t(), keyword) ::
          {:ok, OpenAi.Assistant.DeleteResponse.t()} | :error
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
  @spec delete_message(String.t(), String.t(), keyword) ::
          {:ok, OpenAi.Message.DeleteResponse.t()} | :error
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
  @spec delete_thread(String.t(), keyword) :: {:ok, OpenAi.Thread.DeleteResponse.t()} | :error
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
  @spec get_assistant(String.t(), keyword) :: {:ok, OpenAi.Assistant.t()} | :error
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
  @spec get_message(String.t(), String.t(), keyword) :: {:ok, OpenAi.Message.t()} | :error
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
  @spec get_run(String.t(), String.t(), keyword) :: {:ok, OpenAi.Run.t()} | :error
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
  """
  @spec get_run_step(String.t(), String.t(), String.t(), keyword) ::
          {:ok, OpenAi.Run.Step.t()} | :error
  def get_run_step(thread_id, run_id, step_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id, run_id: run_id, step_id: step_id],
      call: {OpenAi.Assistants, :get_run_step},
      url: "/threads/#{thread_id}/runs/#{run_id}/steps/#{step_id}",
      method: :get,
      response: [{200, {OpenAi.Run.Step, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a thread.
  """
  @spec get_thread(String.t(), keyword) :: {:ok, OpenAi.Thread.t()} | :error
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
      
    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
      

  """
  @spec list_assistants(keyword) :: {:ok, OpenAi.Assistant.ListResponse.t()} | :error
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
      
    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
      
    * `run_id`: Filter messages by the run ID that generated them.
      

  """
  @spec list_messages(String.t(), keyword) :: {:ok, OpenAi.Message.ListResponse.t()} | :error
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
      
    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
      

  """
  @spec list_run_steps(String.t(), String.t(), keyword) ::
          {:ok, OpenAi.Run.Step.ListResponse.t()} | :error
  def list_run_steps(thread_id, run_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit, :order])

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
      
    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
      

  """
  @spec list_runs(String.t(), keyword) :: {:ok, OpenAi.Run.ListResponse.t()} | :error
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
  @spec modify_assistant(String.t(), OpenAi.Assistant.UpdateRequest.t(), keyword) ::
          {:ok, OpenAi.Assistant.t()} | :error
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
  @spec modify_message(String.t(), String.t(), OpenAi.Message.UpdateRequest.t(), keyword) ::
          {:ok, OpenAi.Message.t()} | :error
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
  @spec modify_run(String.t(), String.t(), OpenAi.Run.UpdateRequest.t(), keyword) ::
          {:ok, OpenAi.Run.t()} | :error
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
  @spec modify_thread(String.t(), OpenAi.Thread.UpdateRequest.t(), keyword) ::
          {:ok, OpenAi.Thread.t()} | :error
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
  @spec submit_tool_ouputs_to_run(
          String.t(),
          String.t(),
          OpenAi.Assistant.Tool.Outputs.RunSubmitRequest.t(),
          keyword
        ) :: {:ok, OpenAi.Run.t()} | :error
  def submit_tool_ouputs_to_run(thread_id, run_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [thread_id: thread_id, run_id: run_id, body: body],
      call: {OpenAi.Assistants, :submit_tool_ouputs_to_run},
      url: "/threads/#{thread_id}/runs/#{run_id}/submit_tool_outputs",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Assistant.Tool.Outputs.RunSubmitRequest, :t}}],
      response: [{200, {OpenAi.Run, :t}}],
      opts: opts
    })
  end
end
