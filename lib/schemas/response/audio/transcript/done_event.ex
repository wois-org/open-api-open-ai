defmodule OpenAi.Response.Audio.Transcript.DoneEvent do
  @moduledoc """
  Provides struct and type for a Response.Audio.Transcript.DoneEvent
  """

  @type t :: %__MODULE__{type: String.t()}

  defstruct [:type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:const, "response.audio.transcript.done"}]
  end
end
