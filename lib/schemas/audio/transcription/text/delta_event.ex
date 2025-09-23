defmodule OpenAi.Audio.Transcription.Text.DeltaEvent do
  @moduledoc """
  Provides struct and type for a Audio.Transcription.Text.DeltaEvent
  """

  @type t :: %__MODULE__{
          delta: String.t(),
          logprobs: [OpenAi.Audio.Transcription.Text.DeltaEvent.Logprobs.t()] | nil,
          type: String.t()
        }

  defstruct [:delta, :logprobs, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      delta: {:string, :generic},
      logprobs: [{OpenAi.Audio.Transcription.Text.DeltaEvent.Logprobs, :t}],
      type: {:const, "transcript.text.delta"}
    ]
  end
end
