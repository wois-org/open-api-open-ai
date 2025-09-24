defmodule OpenAi.AuditLog.Project.Updated do
  @moduledoc """
  Provides struct and type for a AuditLog.Project.Updated
  """

  @type t :: %__MODULE__{
          changes_requested: OpenAi.AuditLog.Project.Updated.ChangesRequested.t() | nil,
          id: String.t() | nil
        }

  defstruct [:changes_requested, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      changes_requested: {OpenAi.AuditLog.Project.Updated.ChangesRequested, :t},
      id: {:string, :generic}
    ]
  end
end
