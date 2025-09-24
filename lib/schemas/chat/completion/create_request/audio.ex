defmodule OpenAi.Chat.Completion.CreateRequest.Audio do
  @moduledoc """
  Provides struct and type for a Chat.Completion.CreateRequest.Audio
  """

  @type t :: %__MODULE__{format: String.t(), voice: String.t()}

  defstruct [:format, :voice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      format: {:enum, ["wav", "aac", "mp3", "flac", "opus", "pcm16"]},
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
