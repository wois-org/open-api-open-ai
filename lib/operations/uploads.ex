defmodule OpenAi.Uploads do
  @moduledoc """
  Provides API endpoints related to uploads
  """

  @default_client OpenAi.Client

  @doc """
  Adds a [Part](/docs/api-reference/uploads/part-object) to an [Upload](/docs/api-reference/uploads/object) object. A Part represents a chunk of bytes from the file you are trying to upload. 

  Each Part can be at most 64 MB, and you can add Parts until you hit the Upload maximum of 8 GB.

  It is possible to add multiple Parts in parallel. You can decide the intended order of the Parts when you [complete the Upload](/docs/api-reference/uploads/complete).

  """
  @spec add_upload_part(
          upload_id :: String.t(),
          body :: OpenAi.Upload.AddPartRequest.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Upload.Part.t()} | {:error, OpenAi.Error.error()}
  def add_upload_part(upload_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [upload_id: upload_id, body: body],
      call: {OpenAi.Uploads, :add_upload_part},
      url: "/uploads/#{upload_id}/parts",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {OpenAi.Upload.AddPartRequest, :t}}],
      response: [{200, {OpenAi.Upload.Part, :t}}],
      opts: opts
    })
  end

  @doc """
  Cancels the Upload. No Parts may be added after an Upload is cancelled.

  """
  @spec cancel_upload(upload_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Upload.t()} | {:error, OpenAi.Error.error()}
  def cancel_upload(upload_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [upload_id: upload_id],
      call: {OpenAi.Uploads, :cancel_upload},
      url: "/uploads/#{upload_id}/cancel",
      method: :post,
      response: [{200, {OpenAi.Upload, :t}}],
      opts: opts
    })
  end

  @doc """
  Completes the [Upload](/docs/api-reference/uploads/object). 

  Within the returned Upload object, there is a nested [File](/docs/api-reference/files/object) object that is ready to use in the rest of the platform.

  You can specify the order of the Parts by passing in an ordered list of the Part IDs.

  The number of bytes uploaded upon completion must match the number of bytes initially specified when creating the Upload object. No Parts may be added after an Upload is completed.

  """
  @spec complete_upload(
          upload_id :: String.t(),
          body :: OpenAi.Upload.CompleteRequest.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Upload.t()} | {:error, OpenAi.Error.error()}
  def complete_upload(upload_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [upload_id: upload_id, body: body],
      call: {OpenAi.Uploads, :complete_upload},
      url: "/uploads/#{upload_id}/complete",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Upload.CompleteRequest, :t}}],
      response: [{200, {OpenAi.Upload, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates an intermediate [Upload](/docs/api-reference/uploads/object) object
  that you can add [Parts](/docs/api-reference/uploads/part-object) to.
  Currently, an Upload can accept at most 8 GB in total and expires after an
  hour after you create it.

  Once you complete the Upload, we will create a
  [File](/docs/api-reference/files/object) object that contains all the parts
  you uploaded. This File is usable in the rest of our platform as a regular
  File object.

  For certain `purpose` values, the correct `mime_type` must be specified. 
  Please refer to documentation for the 
  [supported MIME types for your use case](/docs/assistants/tools/file-search#supported-files).

  For guidance on the proper filename extensions for each purpose, please
  follow the documentation on [creating a
  File](/docs/api-reference/files/create).

  """
  @spec create_upload(body :: OpenAi.Upload.CreateRequest.t(), opts :: keyword) ::
          {:ok, OpenAi.Upload.t()} | {:error, OpenAi.Error.error()}
  def create_upload(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Uploads, :create_upload},
      url: "/uploads",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Upload.CreateRequest, :t}}],
      response: [{200, {OpenAi.Upload, :t}}],
      opts: opts
    })
  end
end
