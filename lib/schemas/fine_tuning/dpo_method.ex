defmodule OpenAi.FineTuning.DPOMethod do
  @moduledoc """
  Provides struct and type for a FineTuning.DPOMethod
  """

  @type t :: %__MODULE__{hyperparameters: OpenAi.FineTuning.DPOMethod.Hyperparameters.t() | nil}

  defstruct [:hyperparameters]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [hyperparameters: {OpenAi.FineTuning.DPOMethod.Hyperparameters, :t}]
  end
end
