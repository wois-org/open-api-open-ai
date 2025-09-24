defmodule OpenAi.Realtime.TranscriptionSession.CreateRequest.InputAudioTranscription do
  @moduledoc """
  Provides struct and type for a Realtime.TranscriptionSession.CreateRequest.InputAudioTranscription
  """

  @type t :: %__MODULE__{
          language: String.t() | nil,
          model: String.t() | nil,
          prompt: String.t() | nil
        }

  defstruct [:language, :model, :prompt]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      language: {:string, :generic},
      model: {:enum, ["gpt-4o-transcribe", "gpt-4o-mini-transcribe", "whisper-1"]},
      prompt: {:string, :generic}
    ]
  end
end
