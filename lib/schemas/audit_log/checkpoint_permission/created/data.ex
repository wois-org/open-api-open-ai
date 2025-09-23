defmodule OpenAi.AuditLog.CheckpointPermission.Created.Data do
  @moduledoc """
  Provides struct and type for a AuditLog.CheckpointPermission.Created.Data
  """

  @type t :: %__MODULE__{
          fine_tuned_model_checkpoint: String.t() | nil,
          project_id: String.t() | nil
        }

  defstruct [:fine_tuned_model_checkpoint, :project_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fine_tuned_model_checkpoint: {:string, :generic}, project_id: {:string, :generic}]
  end
end
