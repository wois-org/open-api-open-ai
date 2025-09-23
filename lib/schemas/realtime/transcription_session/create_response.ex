defmodule OpenAi.Realtime.TranscriptionSession.CreateResponse do
  @moduledoc """
  Provides struct and type for a Realtime.TranscriptionSession.CreateResponse
  """

  @type t :: %__MODULE__{
          client_secret: OpenAi.Realtime.TranscriptionSession.CreateResponse.ClientSecret.t(),
          input_audio_format: String.t() | nil,
          input_audio_transcription:
            OpenAi.Realtime.TranscriptionSession.CreateResponse.InputAudioTranscription.t() | nil,
          modalities: map | nil,
          turn_detection:
            OpenAi.Realtime.TranscriptionSession.CreateResponse.TurnDetection.t() | nil
        }

  defstruct [
    :client_secret,
    :input_audio_format,
    :input_audio_transcription,
    :modalities,
    :turn_detection
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      client_secret: {OpenAi.Realtime.TranscriptionSession.CreateResponse.ClientSecret, :t},
      input_audio_format: {:string, :generic},
      input_audio_transcription:
        {OpenAi.Realtime.TranscriptionSession.CreateResponse.InputAudioTranscription, :t},
      modalities: :map,
      turn_detection: {OpenAi.Realtime.TranscriptionSession.CreateResponse.TurnDetection, :t}
    ]
  end
end
