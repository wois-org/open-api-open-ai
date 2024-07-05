defmodule OpenAi.Chat.Completion.TokenLogprob do
  @moduledoc """
  Provides struct and type for a Chat.Completion.TokenLogprob
  """

  @type t :: %__MODULE__{
          bytes: [integer] | nil,
          logprob: number,
          token: String.t(),
          top_logprobs: [OpenAi.Chat.Completion.TokenLogprobTopLogprobs.t()]
        }

  defstruct [:bytes, :logprob, :token, :top_logprobs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      bytes: [:integer],
      logprob: :number,
      token: {:string, :generic},
      top_logprobs: [{OpenAi.Chat.Completion.TokenLogprobTopLogprobs, :t}]
    ]
  end
end
