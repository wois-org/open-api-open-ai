defmodule OpenAi.Realtime.TranscriptionSession.CreateResponse.TurnDetection do
  @moduledoc """
  Provides struct and type for a Realtime.TranscriptionSession.CreateResponse.TurnDetection
  """

  @type t :: %__MODULE__{
          prefix_padding_ms: integer | nil,
          silence_duration_ms: integer | nil,
          threshold: number | nil,
          type: String.t() | nil
        }

  defstruct [:prefix_padding_ms, :silence_duration_ms, :threshold, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      prefix_padding_ms: :integer,
      silence_duration_ms: :integer,
      threshold: :number,
      type: {:string, :generic}
    ]
  end
end
