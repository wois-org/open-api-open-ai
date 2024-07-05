defmodule OpenAi.Batch.RequestCounts do
  @moduledoc """
  Provides struct and type for a Batch.RequestCounts
  """

  @type t :: %__MODULE__{completed: integer, failed: integer, total: integer}

  defstruct [:completed, :failed, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [completed: :integer, failed: :integer, total: :integer]
  end
end
