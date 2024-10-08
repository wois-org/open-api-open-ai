defmodule OpenAi.VectorStore.File.Batch.FileCounts do
  @moduledoc """
  Provides struct and type for a VectorStore.File.Batch.FileCounts
  """

  @type t :: %__MODULE__{
          cancelled: integer,
          completed: integer,
          failed: integer,
          in_progress: integer,
          total: integer
        }

  defstruct [:cancelled, :completed, :failed, :in_progress, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cancelled: :integer,
      completed: :integer,
      failed: :integer,
      in_progress: :integer,
      total: :integer
    ]
  end
end
