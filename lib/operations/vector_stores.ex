defmodule OpenAi.VectorStores do
  @moduledoc """
  Provides API endpoints related to vector stores
  """

  @default_client OpenAi.Client

  @doc """
  Cancel a vector store file batch. This attempts to cancel the processing of files in this batch as soon as possible.
  """
  @spec cancel_vector_store_file_batch(String.t(), String.t(), keyword) ::
          {:ok, OpenAi.VectorStore.File.Batch.t()} | {:error, OpenAi.Error.error()}
  def cancel_vector_store_file_batch(vector_store_id, batch_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, batch_id: batch_id],
      call: {OpenAi.VectorStores, :cancel_vector_store_file_batch},
      url: "/vector_stores/#{vector_store_id}/file_batches/#{batch_id}/cancel",
      method: :post,
      response: [{200, {OpenAi.VectorStore.File.Batch, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a vector store.
  """
  @spec create_vector_store(OpenAi.VectorStore.CreateRequest.t(), keyword) ::
          {:ok, OpenAi.VectorStore.t()} | {:error, OpenAi.Error.error()}
  def create_vector_store(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.VectorStores, :create_vector_store},
      url: "/vector_stores",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.VectorStore.CreateRequest, :t}}],
      response: [{200, {OpenAi.VectorStore, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a vector store file by attaching a [File](https://platform.openai.com/docs/api-reference/files) to a [vector store](https://platform.openai.com/docs/api-reference/vector-stores/object).
  """
  @spec create_vector_store_file(String.t(), OpenAi.VectorStore.File.CreateRequest.t(), keyword) ::
          {:ok, OpenAi.VectorStore.File.t()} | {:error, OpenAi.Error.error()}
  def create_vector_store_file(vector_store_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, body: body],
      call: {OpenAi.VectorStores, :create_vector_store_file},
      url: "/vector_stores/#{vector_store_id}/files",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.VectorStore.File.CreateRequest, :t}}],
      response: [{200, {OpenAi.VectorStore.File, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a vector store file batch.
  """
  @spec create_vector_store_file_batch(
          String.t(),
          OpenAi.VectorStore.File.Batch.CreateRequest.t(),
          keyword
        ) :: {:ok, OpenAi.VectorStore.File.Batch.t()} | {:error, OpenAi.Error.error()}
  def create_vector_store_file_batch(vector_store_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, body: body],
      call: {OpenAi.VectorStores, :create_vector_store_file_batch},
      url: "/vector_stores/#{vector_store_id}/file_batches",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.VectorStore.File.Batch.CreateRequest, :t}}],
      response: [{200, {OpenAi.VectorStore.File.Batch, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete a vector store.
  """
  @spec delete_vector_store(String.t(), keyword) ::
          {:ok, OpenAi.VectorStore.DeleteResponse.t()} | {:error, OpenAi.Error.error()}
  def delete_vector_store(vector_store_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id],
      call: {OpenAi.VectorStores, :delete_vector_store},
      url: "/vector_stores/#{vector_store_id}",
      method: :delete,
      response: [{200, {OpenAi.VectorStore.DeleteResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete a vector store file. This will remove the file from the vector store but the file itself will not be deleted. To delete the file, use the [delete file](https://platform.openai.com/docs/api-reference/files/delete) endpoint.
  """
  @spec delete_vector_store_file(String.t(), String.t(), keyword) ::
          {:ok, OpenAi.VectorStore.File.DeleteResponse.t()} | {:error, OpenAi.Error.error()}
  def delete_vector_store_file(vector_store_id, file_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, file_id: file_id],
      call: {OpenAi.VectorStores, :delete_vector_store_file},
      url: "/vector_stores/#{vector_store_id}/files/#{file_id}",
      method: :delete,
      response: [{200, {OpenAi.VectorStore.File.DeleteResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a vector store.
  """
  @spec get_vector_store(String.t(), keyword) ::
          {:ok, OpenAi.VectorStore.t()} | {:error, OpenAi.Error.error()}
  def get_vector_store(vector_store_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id],
      call: {OpenAi.VectorStores, :get_vector_store},
      url: "/vector_stores/#{vector_store_id}",
      method: :get,
      response: [{200, {OpenAi.VectorStore, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a vector store file.
  """
  @spec get_vector_store_file(String.t(), String.t(), keyword) ::
          {:ok, OpenAi.VectorStore.File.t()} | {:error, OpenAi.Error.error()}
  def get_vector_store_file(vector_store_id, file_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, file_id: file_id],
      call: {OpenAi.VectorStores, :get_vector_store_file},
      url: "/vector_stores/#{vector_store_id}/files/#{file_id}",
      method: :get,
      response: [{200, {OpenAi.VectorStore.File, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a vector store file batch.
  """
  @spec get_vector_store_file_batch(String.t(), String.t(), keyword) ::
          {:ok, OpenAi.VectorStore.File.Batch.t()} | {:error, OpenAi.Error.error()}
  def get_vector_store_file_batch(vector_store_id, batch_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, batch_id: batch_id],
      call: {OpenAi.VectorStores, :get_vector_store_file_batch},
      url: "/vector_stores/#{vector_store_id}/file_batches/#{batch_id}",
      method: :get,
      response: [{200, {OpenAi.VectorStore.File.Batch, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of vector store files in a batch.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.

    * `order`: Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.

    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.

    * `filter`: Filter by file status. One of `in_progress`, `completed`, `failed`, `cancelled`.

  """
  @spec list_files_in_vector_store_batch(String.t(), String.t(), keyword) ::
          {:ok, OpenAi.VectorStore.File.ListResponse.t()} | {:error, OpenAi.Error.error()}
  def list_files_in_vector_store_batch(vector_store_id, batch_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :filter, :limit, :order])

    client.request(%{
      args: [vector_store_id: vector_store_id, batch_id: batch_id],
      call: {OpenAi.VectorStores, :list_files_in_vector_store_batch},
      url: "/vector_stores/#{vector_store_id}/file_batches/#{batch_id}/files",
      method: :get,
      query: query,
      response: [{200, {OpenAi.VectorStore.File.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of vector store files.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.

    * `order`: Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.

    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.

    * `filter`: Filter by file status. One of `in_progress`, `completed`, `failed`, `cancelled`.

  """
  @spec list_vector_store_files(String.t(), keyword) ::
          {:ok, OpenAi.VectorStore.File.ListResponse.t()} | {:error, OpenAi.Error.error()}
  def list_vector_store_files(vector_store_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :filter, :limit, :order])

    client.request(%{
      args: [vector_store_id: vector_store_id],
      call: {OpenAi.VectorStores, :list_vector_store_files},
      url: "/vector_stores/#{vector_store_id}/files",
      method: :get,
      query: query,
      response: [{200, {OpenAi.VectorStore.File.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of vector stores.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.

    * `order`: Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.

    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.

    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.


  """
  @spec list_vector_stores(keyword) ::
          {:ok, OpenAi.VectorStore.ListResponse.t()} | {:error, OpenAi.Error.error()}
  def list_vector_stores(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit, :order])

    client.request(%{
      args: [],
      call: {OpenAi.VectorStores, :list_vector_stores},
      url: "/vector_stores",
      method: :get,
      query: query,
      response: [{200, {OpenAi.VectorStore.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Modifies a vector store.
  """
  @spec modify_vector_store(String.t(), OpenAi.VectorStore.UpdateRequest.t(), keyword) ::
          {:ok, OpenAi.VectorStore.t()} | {:error, OpenAi.Error.error()}
  def modify_vector_store(vector_store_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, body: body],
      call: {OpenAi.VectorStores, :modify_vector_store},
      url: "/vector_stores/#{vector_store_id}",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.VectorStore.UpdateRequest, :t}}],
      response: [{200, {OpenAi.VectorStore, :t}}],
      opts: opts
    })
  end
end
