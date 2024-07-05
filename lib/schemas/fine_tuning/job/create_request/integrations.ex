defmodule OpenAi.FineTuning.Job.CreateRequest.Integrations do
  @moduledoc """
  Provides struct and type for a FineTuning.Job.CreateRequest.Integrations
  """

  @type t :: %__MODULE__{
          type: String.t(),
          wandb: OpenAi.FineTuning.Job.CreateRequest.IntegrationsWandb.t()
        }

  defstruct [:type, :wandb]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:const, "wandb"}, wandb: {OpenAi.FineTuning.Job.CreateRequest.IntegrationsWandb, :t}]
  end
end
