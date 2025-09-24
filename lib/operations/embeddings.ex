defmodule OpenAi.Embeddings do
  @moduledoc """
  Provides API endpoint related to embeddings
  """

  @default_client OpenAi.Client

  @doc """
  Creates an embedding vector representing the input text.
  """
  @spec create_embedding(body :: OpenAi.Embedding.CreateRequest.t(), opts :: keyword) ::
          {:ok, OpenAi.Embedding.CreateResponse.t()} | {:error, OpenAi.Error.error()}
  def create_embedding(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Embeddings, :create_embedding},
      url: "/embeddings",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Embedding.CreateRequest, :t}}],
      response: [{200, {OpenAi.Embedding.CreateResponse, :t}}],
      opts: opts
    })
  end
end
