defmodule OpenAi.Files do
  @moduledoc """
  Provides API endpoints related to files
  """

  @default_client OpenAi.Client

  @doc """
  Upload a file that can be used across various endpoints. Individual files can be up to 512 MB, and the size of all files uploaded by one organization can be up to 100 GB.

  The Assistants API supports files up to 2 million tokens and of specific file types. See the [Assistants Tools guide](https://platform.openai.com/docs/assistants/tools) for details.

  The Fine-tuning API only supports `.jsonl` files. The input also has certain required formats for fine-tuning [chat](https://platform.openai.com/docs/api-reference/fine-tuning/chat-input) or [completions](https://platform.openai.com/docs/api-reference/fine-tuning/completions-input) models.

  The Batch API only supports `.jsonl` files up to 100 MB in size. The input also has a specific required [format](https://platform.openai.com/docs/api-reference/batch/request-input).

  Please [contact us](https://help.openai.com/) if you need to increase these storage limits.

  """
  @spec create_file(OpenAi.File.CreateRequest.t(), keyword) ::
          {:ok, OpenAi.File.t()} | {:error, OpenAi.Error.error()}
  def create_file(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Files, :create_file},
      url: "/files",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {OpenAi.File.CreateRequest, :t}}],
      response: [{200, {OpenAi.File, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete a file.
  """
  @spec delete_file(String.t(), keyword) ::
          {:ok, OpenAi.File.DeleteResponse.t()} | {:error, OpenAi.Error.error()}
  def delete_file(file_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [file_id: file_id],
      call: {OpenAi.Files, :delete_file},
      url: "/files/#{file_id}",
      method: :delete,
      response: [{200, {OpenAi.File.DeleteResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns the contents of the specified file.
  """
  @spec download_file(String.t(), keyword) :: {:ok, String.t()} | {:error, OpenAi.Error.error()}
  def download_file(file_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [file_id: file_id],
      call: {OpenAi.Files, :download_file},
      url: "/files/#{file_id}/content",
      method: :get,
      response: [{200, {:string, :generic}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of files that belong to the user's organization.

  ## Options

    * `purpose`: Only return files with the given purpose.

  """
  @spec list_files(keyword) ::
          {:ok, OpenAi.File.ListResponse.t()} | {:error, OpenAi.Error.error()}
  def list_files(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:purpose])

    client.request(%{
      args: [],
      call: {OpenAi.Files, :list_files},
      url: "/files",
      method: :get,
      query: query,
      response: [{200, {OpenAi.File.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns information about a specific file.
  """
  @spec retrieve_file(String.t(), keyword) ::
          {:ok, OpenAi.File.t()} | {:error, OpenAi.Error.error()}
  def retrieve_file(file_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [file_id: file_id],
      call: {OpenAi.Files, :retrieve_file},
      url: "/files/#{file_id}",
      method: :get,
      response: [{200, {OpenAi.File, :t}}],
      opts: opts
    })
  end
end
