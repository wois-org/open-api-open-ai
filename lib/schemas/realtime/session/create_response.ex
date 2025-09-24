defmodule OpenAi.Realtime.Session.CreateResponse do
  @moduledoc """
  Provides struct and type for a Realtime.Session.CreateResponse
  """

  @type t :: %__MODULE__{
          client_secret: OpenAi.Realtime.Session.CreateResponse.ClientSecret.t(),
          input_audio_format: String.t() | nil,
          input_audio_transcription:
            OpenAi.Realtime.Session.CreateResponse.InputAudioTranscription.t() | nil,
          instructions: String.t() | nil,
          max_response_output_tokens: integer | String.t() | nil,
          modalities: map | nil,
          output_audio_format: String.t() | nil,
          temperature: number | nil,
          tool_choice: String.t() | nil,
          tools: [OpenAi.Realtime.Session.CreateResponse.Tool.t()] | nil,
          turn_detection: OpenAi.Realtime.Session.CreateResponse.TurnDetection.t() | nil,
          voice: String.t() | nil
        }

  defstruct [
    :client_secret,
    :input_audio_format,
    :input_audio_transcription,
    :instructions,
    :max_response_output_tokens,
    :modalities,
    :output_audio_format,
    :temperature,
    :tool_choice,
    :tools,
    :turn_detection,
    :voice
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      client_secret: {OpenAi.Realtime.Session.CreateResponse.ClientSecret, :t},
      input_audio_format: {:string, :generic},
      input_audio_transcription:
        {OpenAi.Realtime.Session.CreateResponse.InputAudioTranscription, :t},
      instructions: {:string, :generic},
      max_response_output_tokens: {:union, [:integer, const: "inf"]},
      modalities: :map,
      output_audio_format: {:string, :generic},
      temperature: :number,
      tool_choice: {:string, :generic},
      tools: [{OpenAi.Realtime.Session.CreateResponse.Tool, :t}],
      turn_detection: {OpenAi.Realtime.Session.CreateResponse.TurnDetection, :t},
      voice:
        {:union,
         enum: [
           "alloy",
           "ash",
           "ballad",
           "coral",
           "echo",
           "fable",
           "onyx",
           "nova",
           "sage",
           "shimmer",
           "verse"
         ],
         string: :generic}
    ]
  end
end
