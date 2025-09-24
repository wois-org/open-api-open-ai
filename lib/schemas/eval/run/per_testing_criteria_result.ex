defmodule OpenAi.Eval.Run.PerTestingCriteriaResult do
  @moduledoc """
  Provides struct and type for a Eval.Run.PerTestingCriteriaResult
  """

  @type t :: %__MODULE__{failed: integer, passed: integer, testing_criteria: String.t()}

  defstruct [:failed, :passed, :testing_criteria]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [failed: :integer, passed: :integer, testing_criteria: {:string, :generic}]
  end
end
