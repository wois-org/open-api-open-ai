defmodule OpenAi.Audio.Transcription.CreateResponse.Json do
  @moduledoc """
  Provides struct and type for a Audio.Transcription.CreateResponse.Json
  """

  @type t :: %__MODULE__{text: String.t()}

  defstruct [:text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [text: {:string, :generic}]
  end
end
