defmodule OpenAi.Eval.CustomDataSource.Config.Create do
  @moduledoc """
  Provides struct and type for a Eval.CustomDataSource.Config.Create
  """

  @type t :: %__MODULE__{include_sample_schema: boolean | nil, item_schema: map, type: String.t()}

  defstruct [:include_sample_schema, :item_schema, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [include_sample_schema: :boolean, item_schema: :map, type: {:const, "custom"}]
  end
end
