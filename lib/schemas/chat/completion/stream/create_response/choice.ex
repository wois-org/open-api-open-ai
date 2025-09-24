defmodule OpenAi.Chat.Completion.Stream.CreateResponse.Choice do
  @moduledoc """
  Provides struct and type for a Chat.Completion.Stream.CreateResponse.Choice
  """

  @type t :: %__MODULE__{
          delta: OpenAi.Chat.Completion.Stream.ResponseDelta.t(),
          finish_reason: String.t() | nil,
          index: integer,
          logprobs: OpenAi.Chat.Completion.Stream.CreateResponse.ChoiceLogprobs.t() | nil
        }

  defstruct [:delta, :finish_reason, :index, :logprobs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      delta: {OpenAi.Chat.Completion.Stream.ResponseDelta, :t},
      finish_reason: {:enum, ["stop", "length", "tool_calls", "content_filter", "function_call"]},
      index: :integer,
      logprobs: {OpenAi.Chat.Completion.Stream.CreateResponse.ChoiceLogprobs, :t}
    ]
  end
end
