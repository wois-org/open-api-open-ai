defmodule OpenAi.FineTuning.SupervisedMethod do
  @moduledoc """
  Provides struct and type for a FineTuning.SupervisedMethod
  """

  @type t :: %__MODULE__{
          hyperparameters: OpenAi.FineTuning.SupervisedMethod.Hyperparameters.t() | nil
        }

  defstruct [:hyperparameters]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [hyperparameters: {OpenAi.FineTuning.SupervisedMethod.Hyperparameters, :t}]
  end
end
