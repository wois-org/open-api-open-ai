defmodule OpenAi.Eval.LogsDataSource.Config.Create do
  @moduledoc """
  Provides struct and type for a Eval.LogsDataSource.Config.Create
  """

  @type t :: %__MODULE__{metadata: map | nil, type: String.t()}

  defstruct [:metadata, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [metadata: :map, type: {:const, "logs"}]
  end
end
