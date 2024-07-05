defmodule OpenAi.FineTuning.Integration do
  @moduledoc """
  Provides struct and type for a FineTuning.Integration
  """

  @type t :: %__MODULE__{type: String.t(), wandb: OpenAi.FineTuning.Integration.Wandb.t()}

  defstruct [:type, :wandb]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:const, "wandb"}, wandb: {OpenAi.FineTuning.Integration.Wandb, :t}]
  end
end
