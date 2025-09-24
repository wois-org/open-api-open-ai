defmodule OpenAi.Audio.Transcription.CreateResponse.Json do
  @moduledoc """
  Provides struct and type for a Audio.Transcription.CreateResponse.Json
  """

  @type t :: %__MODULE__{
          logprobs: [OpenAi.Audio.Transcription.CreateResponse.JsonLogprobs.t()] | nil,
          text: String.t()
        }

  defstruct [:logprobs, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      logprobs: [{OpenAi.Audio.Transcription.CreateResponse.JsonLogprobs, :t}],
      text: {:string, :generic}
    ]
  end
end
