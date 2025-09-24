defmodule OpenAi.Audio.Translation.CreateResponse.VerboseJson do
  @moduledoc """
  Provides struct and type for a Audio.Translation.CreateResponse.VerboseJson
  """

  @type t :: %__MODULE__{
          duration: number,
          language: String.t(),
          segments: [OpenAi.Audio.Transcription.Segment.t()] | nil,
          text: String.t()
        }

  defstruct [:duration, :language, :segments, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      duration: :number,
      language: {:string, :generic},
      segments: [{OpenAi.Audio.Transcription.Segment, :t}],
      text: {:string, :generic}
    ]
  end
end
