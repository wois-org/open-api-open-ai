defmodule OpenAi.Eval.Completions.RunDataSource.CreateSamplingParams do
  @moduledoc """
  Provides struct and type for a Eval.Completions.RunDataSource.CreateSamplingParams
  """

  @type t :: %__MODULE__{
          max_completion_tokens: integer | nil,
          seed: integer | nil,
          temperature: number | nil,
          top_p: number | nil
        }

  defstruct [:max_completion_tokens, :seed, :temperature, :top_p]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [max_completion_tokens: :integer, seed: :integer, temperature: :number, top_p: :number]
  end
end
