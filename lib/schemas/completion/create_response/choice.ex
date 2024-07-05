defmodule OpenAi.Completion.CreateResponse.Choice do
  @moduledoc """
  Provides struct and type for a Completion.CreateResponse.Choice
  """

  @type t :: %__MODULE__{
          finish_reason: String.t(),
          index: integer,
          logprobs: OpenAi.Completion.CreateResponse.Choice.Logprobs.t() | nil,
          text: String.t()
        }

  defstruct [:finish_reason, :index, :logprobs, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      finish_reason: {:enum, ["stop", "length", "content_filter"]},
      index: :integer,
      logprobs: {OpenAi.Completion.CreateResponse.Choice.Logprobs, :t},
      text: {:string, :generic}
    ]
  end
end
