defmodule OpenAi.Chat.Completion.CreateResponse.Choice do
  @moduledoc """
  Provides struct and type for a Chat.Completion.CreateResponse.Choice
  """

  @type t :: %__MODULE__{
          finish_reason: String.t(),
          index: integer,
          logprobs: OpenAi.Chat.Completion.CreateResponse.Choice.Logprobs.t() | nil,
          message: OpenAi.Chat.Completion.Response.Message.t()
        }

  defstruct [:finish_reason, :index, :logprobs, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      finish_reason: {:enum, ["stop", "length", "tool_calls", "content_filter", "function_call"]},
      index: :integer,
      logprobs: {OpenAi.Chat.Completion.CreateResponse.Choice.Logprobs, :t},
      message: {OpenAi.Chat.Completion.Response.Message, :t}
    ]
  end
end
