defmodule OpenAi.Certificates do
  @moduledoc """
  Provides API endpoints related to certificates
  """

  @default_client OpenAi.Client

  @doc """
  Activate certificates at the organization level.

  You can atomically and idempotently activate up to 10 certificates at a time.

  """
  @spec activate_organization_certificates(
          body :: OpenAi.Certificate.ToggleRequest.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Certificate.ListResponse.t()} | {:error, OpenAi.Error.error()}
  def activate_organization_certificates(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Certificates, :activate_organization_certificates},
      url: "/organization/certificates/activate",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Certificate.ToggleRequest, :t}}],
      response: [{200, {OpenAi.Certificate.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Activate certificates at the project level.

  You can atomically and idempotently activate up to 10 certificates at a time.

  """
  @spec activate_project_certificates(
          project_id :: String.t(),
          body :: OpenAi.Certificate.ToggleRequest.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Certificate.ListResponse.t()} | {:error, OpenAi.Error.error()}
  def activate_project_certificates(project_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, body: body],
      call: {OpenAi.Certificates, :activate_project_certificates},
      url: "/organization/projects/#{project_id}/certificates/activate",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Certificate.ToggleRequest, :t}}],
      response: [{200, {OpenAi.Certificate.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Deactivate certificates at the organization level.

  You can atomically and idempotently deactivate up to 10 certificates at a time.

  """
  @spec deactivate_organization_certificates(
          body :: OpenAi.Certificate.ToggleRequest.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Certificate.ListResponse.t()} | {:error, OpenAi.Error.error()}
  def deactivate_organization_certificates(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Certificates, :deactivate_organization_certificates},
      url: "/organization/certificates/deactivate",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Certificate.ToggleRequest, :t}}],
      response: [{200, {OpenAi.Certificate.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Deactivate certificates at the project level.

  You can atomically and idempotently deactivate up to 10 certificates at a time.

  """
  @spec deactivate_project_certificates(
          project_id :: String.t(),
          body :: OpenAi.Certificate.ToggleRequest.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Certificate.ListResponse.t()} | {:error, OpenAi.Error.error()}
  def deactivate_project_certificates(project_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, body: body],
      call: {OpenAi.Certificates, :deactivate_project_certificates},
      url: "/organization/projects/#{project_id}/certificates/deactivate",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Certificate.ToggleRequest, :t}}],
      response: [{200, {OpenAi.Certificate.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete a certificate from the organization.

  The certificate must be inactive for the organization and all projects.

  """
  @spec delete_certificate(certificate_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Certificate.DeleteResponse.t()} | {:error, OpenAi.Error.error()}
  def delete_certificate(certificate_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [certificate_id: certificate_id],
      call: {OpenAi.Certificates, :delete_certificate},
      url: "/organization/certificates/#{certificate_id}",
      method: :delete,
      response: [{200, {OpenAi.Certificate.DeleteResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a certificate that has been uploaded to the organization.

  You can get a certificate regardless of whether it is active or not.


  ## Options

    * `include`: A list of additional fields to include in the response. Currently the only supported value is `content` to fetch the PEM content of the certificate.

  """
  @spec get_certificate(certificate_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Certificate.t()} | {:error, OpenAi.Error.error()}
  def get_certificate(certificate_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include])

    client.request(%{
      args: [certificate_id: certificate_id],
      call: {OpenAi.Certificates, :get_certificate},
      url: "/organization/certificates/#{certificate_id}",
      method: :get,
      query: query,
      response: [{200, {OpenAi.Certificate, :t}}],
      opts: opts
    })
  end

  @doc """
  List uploaded certificates for this organization.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      
    * `order`: Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      

  """
  @spec list_organization_certificates(opts :: keyword) ::
          {:ok, OpenAi.Certificate.ListResponse.t()} | {:error, OpenAi.Error.error()}
  def list_organization_certificates(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :order])

    client.request(%{
      args: [],
      call: {OpenAi.Certificates, :list_organization_certificates},
      url: "/organization/certificates",
      method: :get,
      query: query,
      response: [{200, {OpenAi.Certificate.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  List certificates for this project.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      
    * `order`: Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      

  """
  @spec list_project_certificates(project_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAi.Certificate.ListResponse.t()} | {:error, OpenAi.Error.error()}
  def list_project_certificates(project_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :order])

    client.request(%{
      args: [project_id: project_id],
      call: {OpenAi.Certificates, :list_project_certificates},
      url: "/organization/projects/#{project_id}/certificates",
      method: :get,
      query: query,
      response: [{200, {OpenAi.Certificate.ListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Modify a certificate. Note that only the name can be modified.

  """
  @spec modify_certificate(
          certificate_id :: String.t(),
          body :: OpenAi.Certificate.UpdateRequest.t(),
          opts :: keyword
        ) :: {:ok, OpenAi.Certificate.t()} | {:error, OpenAi.Error.error()}
  def modify_certificate(certificate_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [certificate_id: certificate_id, body: body],
      call: {OpenAi.Certificates, :modify_certificate},
      url: "/organization/certificates/#{certificate_id}",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Certificate.UpdateRequest, :t}}],
      response: [{200, {OpenAi.Certificate, :t}}],
      opts: opts
    })
  end

  @doc """
  Upload a certificate to the organization. This does **not** automatically activate the certificate.

  Organizations can upload up to 50 certificates.

  """
  @spec upload_certificate(body :: OpenAi.Certificate.UploadRequest.t(), opts :: keyword) ::
          {:ok, OpenAi.Certificate.t()} | {:error, OpenAi.Error.error()}
  def upload_certificate(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Certificates, :upload_certificate},
      url: "/organization/certificates",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Certificate.UploadRequest, :t}}],
      response: [{200, {OpenAi.Certificate, :t}}],
      opts: opts
    })
  end
end
