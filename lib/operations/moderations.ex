defmodule OpenAi.Moderations do
  @moduledoc """
  Provides API endpoint related to moderations
  """

  @default_client OpenAi.Client

  @doc """
  Classifies if text is potentially harmful.
  """
  @spec create_moderation(OpenAi.Moderation.CreateRequest.t(), keyword) ::
          {:ok, OpenAi.Moderation.CreateResponse.t()} | :error
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
