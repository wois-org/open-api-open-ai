defmodule OpenAi.AuditLog.ServiceAccount.Updated do
  @moduledoc """
  Provides struct and type for a AuditLog.ServiceAccount.Updated
  """

  @type t :: %__MODULE__{
          changes_requested: OpenAi.AuditLog.ServiceAccount.UpdatedChangesRequested.t() | nil,
          id: String.t() | nil
        }

  defstruct [:changes_requested, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      changes_requested: {OpenAi.AuditLog.ServiceAccount.UpdatedChangesRequested, :t},
      id: {:string, :generic}
    ]
  end
end
