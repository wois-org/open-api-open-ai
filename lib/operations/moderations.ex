defmodule OpenAi.Moderations do
  @moduledoc """
  Provides API endpoint related to moderations
  """

  @default_client OpenAi.Client

  @doc """
  Classifies if text and/or image inputs are potentially harmful. Learn
  more in the [moderation guide](/docs/guides/moderation).

  """
  @spec create_moderation(body :: OpenAi.Moderation.CreateRequest.t(), opts :: keyword) ::
          {:ok, OpenAi.Moderation.CreateResponse.t()} | {:error, OpenAi.Error.error()}
  def create_moderation(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Moderations, :create_moderation},
      url: "/moderations",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Moderation.CreateRequest, :t}}],
      response: [{200, {OpenAi.Moderation.CreateResponse, :t}}],
      opts: opts
    })
  end
end
