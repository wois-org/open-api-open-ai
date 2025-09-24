defmodule OpenAi.FineTuning.CheckpointPermission do
  @moduledoc """
  Provides struct and type for a FineTuning.CheckpointPermission
  """

  @type t :: %__MODULE__{
          created_at: integer,
          id: String.t(),
          object: String.t(),
          project_id: String.t()
        }

  defstruct [:created_at, :id, :object, :project_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      id: {:string, :generic},
      object: {:const, "checkpoint.permission"},
      project_id: {:string, :generic}
    ]
  end
end
