defmodule OpenAi.Eval.StoredCompletions.DataSourceConfig do
  @moduledoc """
  Provides struct and type for a Eval.StoredCompletions.DataSourceConfig
  """

  @type t :: %__MODULE__{metadata: map | nil, schema: map, type: String.t()}

  defstruct [:metadata, :schema, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [metadata: :map, schema: :map, type: {:const, "stored_completions"}]
  end
end
