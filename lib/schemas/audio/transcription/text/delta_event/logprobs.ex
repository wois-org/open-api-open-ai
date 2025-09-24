defmodule OpenAi.Audio.Transcription.Text.DeltaEvent.Logprobs do
  @moduledoc """
  Provides struct and type for a Audio.Transcription.Text.DeltaEvent.Logprobs
  """

  @type t :: %__MODULE__{bytes: [integer] | nil, logprob: number | nil, token: String.t() | nil}

  defstruct [:bytes, :logprob, :token]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [bytes: [:integer], logprob: :number, token: {:string, :generic}]
  end
end
