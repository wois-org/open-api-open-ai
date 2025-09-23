defmodule OpenAi.Audio.Transcription.Text.DoneEvent do
  @moduledoc """
  Provides struct and type for a Audio.Transcription.Text.DoneEvent
  """

  @type t :: %__MODULE__{
          logprobs: [OpenAi.Audio.Transcription.Text.DoneEvent.Logprobs.t()] | nil,
          text: String.t(),
          type: String.t()
        }

  defstruct [:logprobs, :text, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      logprobs: [{OpenAi.Audio.Transcription.Text.DoneEvent.Logprobs, :t}],
      text: {:string, :generic},
      type: {:const, "transcript.text.done"}
    ]
  end
end
