defmodule OpenAi.Realtime.TranscriptionSession.CreateRequest do
  @moduledoc """
  Provides struct and type for a Realtime.TranscriptionSession.CreateRequest
  """

  @type t :: %__MODULE__{
          include: [String.t()] | nil,
          input_audio_format: String.t() | nil,
          input_audio_noise_reduction:
            OpenAi.Realtime.TranscriptionSession.CreateRequest.InputAudioNoiseReduction.t() | nil,
          input_audio_transcription:
            OpenAi.Realtime.TranscriptionSession.CreateRequest.InputAudioTranscription.t() | nil,
          modalities: map | nil,
          turn_detection:
            OpenAi.Realtime.TranscriptionSession.CreateRequest.TurnDetection.t() | nil
        }

  defstruct [
    :include,
    :input_audio_format,
    :input_audio_noise_reduction,
    :input_audio_transcription,
    :modalities,
    :turn_detection
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      include: [string: :generic],
      input_audio_format: {:enum, ["pcm16", "g711_ulaw", "g711_alaw"]},
      input_audio_noise_reduction:
        {OpenAi.Realtime.TranscriptionSession.CreateRequest.InputAudioNoiseReduction, :t},
      input_audio_transcription:
        {OpenAi.Realtime.TranscriptionSession.CreateRequest.InputAudioTranscription, :t},
      modalities: :map,
      turn_detection: {OpenAi.Realtime.TranscriptionSession.CreateRequest.TurnDetection, :t}
    ]
  end
end
