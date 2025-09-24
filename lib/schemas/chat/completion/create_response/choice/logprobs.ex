defmodule OpenAi.Chat.Completion.CreateResponse.Choice.Logprobs do
  @moduledoc """
  Provides struct and type for a Chat.Completion.CreateResponse.Choice.Logprobs
  """

  @type t :: %__MODULE__{
          content: [OpenAi.Chat.Completion.TokenLogprob.t()] | nil,
          refusal: [OpenAi.Chat.Completion.TokenLogprob.t()] | nil
        }

  defstruct [:content, :refusal]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: [{OpenAi.Chat.Completion.TokenLogprob, :t}],
      refusal: [{OpenAi.Chat.Completion.TokenLogprob, :t}]
    ]
  end
end
