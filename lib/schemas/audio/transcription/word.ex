defmodule OpenAi.Audio.Transcription.Word do
  @moduledoc """
  Provides struct and type for a Audio.Transcription.Word
  """

  @type t :: %__MODULE__{end: number, start: number, word: String.t()}

  defstruct [:end, :start, :word]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [end: :number, start: :number, word: {:string, :generic}]
  end
end
