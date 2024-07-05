defmodule OpenAi.Chat do
  @moduledoc """
  Provides API endpoint related to chat
  """

  @default_client OpenAi.Client

  @doc """
  Creates a model response for the given chat conversation.
  """
  @spec create_chat_completion(OpenAi.Chat.Completion.CreateRequest.t(), keyword) ::
          {:ok, OpenAi.Chat.Completion.CreateResponse.t()} | :error
  def create_chat_completion(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Chat, :create_chat_completion},
      url: "/chat/completions",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Chat.Completion.CreateRequest, :t}}],
      response: [{200, {OpenAi.Chat.Completion.CreateResponse, :t}}],
      opts: opts
    })
  end
end
