defmodule OpenAi.Audio.Transcription.CreateResponse.JsonLogprobs do
  @moduledoc """
  Provides struct and type for a Audio.Transcription.CreateResponse.JsonLogprobs
  """

  @type t :: %__MODULE__{bytes: [number] | nil, logprob: number | nil, token: String.t() | nil}

  defstruct [:bytes, :logprob, :token]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [bytes: [:number], logprob: :number, token: {:string, :generic}]
  end
end
