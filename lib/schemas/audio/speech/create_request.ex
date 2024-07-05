defmodule OpenAi.Audio.Speech.CreateRequest do
  @moduledoc """
  Provides struct and type for a Audio.Speech.CreateRequest
  """

  @type t :: %__MODULE__{
          input: String.t(),
          model: String.t(),
          response_format: String.t() | nil,
          speed: number | nil,
          voice: String.t()
        }

  defstruct [:input, :model, :response_format, :speed, :voice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input: {:string, :generic},
      model: {:union, enum: ["tts-1", "tts-1-hd"], string: :generic},
      response_format: {:enum, ["mp3", "opus", "aac", "flac", "wav", "pcm"]},
      speed: :number,
      voice: {:enum, ["alloy", "echo", "fable", "onyx", "nova", "shimmer"]}
    ]
  end
end
