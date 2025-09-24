defmodule OpenAi.Realtime.TranscriptionSession.CreateRequest.InputAudioNoiseReduction do
  @moduledoc """
  Provides struct and type for a Realtime.TranscriptionSession.CreateRequest.InputAudioNoiseReduction
  """

  @type t :: %__MODULE__{type: String.t() | nil}

  defstruct [:type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:enum, ["near_field", "far_field"]}]
  end
end
