defmodule OpenAi.FineTuning.Job.Hyperparameters do
  @moduledoc """
  Provides struct and type for a FineTuning.Job.Hyperparameters
  """

  @type t :: %__MODULE__{n_epochs: integer | String.t()}

  defstruct [:n_epochs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [n_epochs: {:union, [:integer, const: "auto"]}]
  end
end
