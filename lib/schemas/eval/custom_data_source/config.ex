defmodule OpenAi.Eval.CustomDataSource.Config do
  @moduledoc """
  Provides struct and type for a Eval.CustomDataSource.Config
  """

  @type t :: %__MODULE__{schema: map, type: String.t()}

  defstruct [:schema, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [schema: :map, type: {:const, "custom"}]
  end
end
