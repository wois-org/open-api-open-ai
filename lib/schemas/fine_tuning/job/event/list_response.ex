defmodule OpenAi.FineTuning.Job.Event.ListResponse do
  @moduledoc """
  Provides struct and type for a FineTuning.Job.Event.ListResponse
  """

  @type t :: %__MODULE__{data: [OpenAi.FineTuning.Job.Event.t()], object: String.t()}

  defstruct [:data, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{OpenAi.FineTuning.Job.Event, :t}], object: {:const, "list"}]
  end
end
