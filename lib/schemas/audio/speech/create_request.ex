defmodule OpenAi.Audio.Speech.CreateRequest do
  @moduledoc """
  Provides struct and type for a Audio.Speech.CreateRequest
  """

  @type t :: %__MODULE__{
          input: String.t(),
          instructions: String.t() | nil,
          model: String.t(),
          response_format: String.t() | nil,
          speed: number | nil,
          voice: String.t()
        }

  defstruct [:input, :instructions, :model, :response_format, :speed, :voice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input: {:string, :generic},
      instructions: {:string, :generic},
      model: {:union, enum: ["tts-1", "tts-1-hd", "gpt-4o-mini-tts"], string: :generic},
      response_format: {:enum, ["mp3", "opus", "aac", "flac", "wav", "pcm"]},
      speed: :number,
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
