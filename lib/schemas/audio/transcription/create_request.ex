defmodule OpenAi.Audio.Transcription.CreateRequest do
  @moduledoc """
  Provides struct and type for a Audio.Transcription.CreateRequest
  """

  @type t :: %__MODULE__{
          file: String.t(),
          include: [String.t()] | nil,
          language: String.t() | nil,
          model: String.t(),
          prompt: String.t() | nil,
          response_format: String.t() | nil,
          stream: boolean | nil,
          temperature: number | nil,
          timestamp_granularities: [String.t()] | nil
        }

  defstruct [
    :file,
    :include,
    :language,
    :model,
    :prompt,
    :response_format,
    :stream,
    :temperature,
    :timestamp_granularities
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      file: {:string, :generic},
      include: [const: "logprobs"],
      language: {:string, :generic},
      model:
        {:union,
         enum: ["whisper-1", "gpt-4o-transcribe", "gpt-4o-mini-transcribe"], string: :generic},
      prompt: {:string, :generic},
      response_format: {:enum, ["json", "text", "srt", "verbose_json", "vtt"]},
      stream: :boolean,
      temperature: :number,
      timestamp_granularities: [enum: ["word", "segment"]]
    ]
  end
end
