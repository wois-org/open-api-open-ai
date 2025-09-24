defmodule OpenAi.Images do
  @moduledoc """
  Provides API endpoints related to images
  """

  @default_client OpenAi.Client

  @doc """
  Creates an image given a prompt. [Learn more](/docs/guides/images).

  """
  @spec create_image(body :: OpenAi.Image.CreateRequest.t(), opts :: keyword) ::
          {:ok, OpenAi.Image.Response.t()} | {:error, OpenAi.Error.error()}
  def create_image(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Images, :create_image},
      url: "/images/generations",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Image.CreateRequest, :t}}],
      response: [{200, {OpenAi.Image.Response, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates an edited or extended image given one or more source images and a prompt. This endpoint only supports `gpt-image-1` and `dall-e-2`.
  """
  @spec create_image_edit(body :: OpenAi.Image.EditCreateRequest.t(), opts :: keyword) ::
          {:ok, OpenAi.Image.Response.t()} | {:error, OpenAi.Error.error()}
  def create_image_edit(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Images, :create_image_edit},
      url: "/images/edits",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {OpenAi.Image.EditCreateRequest, :t}}],
      response: [{200, {OpenAi.Image.Response, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates a variation of a given image. This endpoint only supports `dall-e-2`.
  """
  @spec create_image_variation(body :: OpenAi.Image.VariationCreateRequest.t(), opts :: keyword) ::
          {:ok, OpenAi.Image.Response.t()} | {:error, OpenAi.Error.error()}
  def create_image_variation(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Images, :create_image_variation},
      url: "/images/variations",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {OpenAi.Image.VariationCreateRequest, :t}}],
      response: [{200, {OpenAi.Image.Response, :t}}],
      opts: opts
    })
  end
end
