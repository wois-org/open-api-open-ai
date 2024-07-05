defmodule OpenAi.Audio.Transcription.CreateResponse.VerboseJson do
  @moduledoc """
  Provides struct and type for a Audio.Transcription.CreateResponse.VerboseJson
  """

  @type t :: %__MODULE__{
          duration: String.t(),
          language: String.t(),
          segments: [OpenAi.Audio.Transcription.Segment.t()] | nil,
          text: String.t(),
          words: [OpenAi.Audio.Transcription.Word.t()] | nil
        }

  defstruct [:duration, :language, :segments, :text, :words]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      duration: {:string, :generic},
      language: {:string, :generic},
      segments: [{OpenAi.Audio.Transcription.Segment, :t}],
      text: {:string, :generic},
      words: [{OpenAi.Audio.Transcription.Word, :t}]
    ]
  end
end
