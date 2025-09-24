defmodule OpenAi.Tool.Filter.Compound do
  @moduledoc """
  Provides struct and type for a Tool.Filter.Compound
  """

  @type t :: %__MODULE__{filters: [map | OpenAi.Tool.Filter.Comparison.t()], type: String.t()}

  defstruct [:filters, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [filters: [union: [:map, {OpenAi.Tool.Filter.Comparison, :t}]], type: {:enum, ["and", "or"]}]
  end
end
