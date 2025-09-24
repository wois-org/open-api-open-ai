defmodule OpenAi.Usage.Costs.ResultAmount do
  @moduledoc """
  Provides struct and type for a Usage.Costs.ResultAmount
  """

  @type t :: %__MODULE__{currency: String.t() | nil, value: number | nil}

  defstruct [:currency, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [currency: {:string, :generic}, value: :number]
  end
end
