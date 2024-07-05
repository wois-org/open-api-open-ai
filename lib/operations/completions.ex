defmodule OpenAi.Completions do
  @moduledoc """
  Provides API endpoint related to completions
  """

  @default_client OpenAi.Client

  @doc """
  Creates a completion for the provided prompt and parameters.
  """
  @spec create_completion(OpenAi.Completion.CreateRequest.t(), keyword) ::
          {:ok, OpenAi.Completion.CreateResponse.t()} | :error
  def create_completion(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Completions, :create_completion},
      url: "/completions",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Completion.CreateRequest, :t}}],
      response: [{200, {OpenAi.Completion.CreateResponse, :t}}],
      opts: opts
    })
  end
end
