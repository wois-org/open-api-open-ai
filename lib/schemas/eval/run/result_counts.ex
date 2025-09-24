defmodule OpenAi.Eval.Run.ResultCounts do
  @moduledoc """
  Provides struct and type for a Eval.Run.ResultCounts
  """

  @type t :: %__MODULE__{errored: integer, failed: integer, passed: integer, total: integer}

  defstruct [:errored, :failed, :passed, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [errored: :integer, failed: :integer, passed: :integer, total: :integer]
  end
end
