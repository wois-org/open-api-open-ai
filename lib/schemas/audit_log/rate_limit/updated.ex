defmodule OpenAi.AuditLog.RateLimit.Updated do
  @moduledoc """
  Provides struct and type for a AuditLog.RateLimit.Updated
  """

  @type t :: %__MODULE__{
          changes_requested: OpenAi.AuditLog.RateLimit.Updated.ChangesRequested.t() | nil,
          id: String.t() | nil
        }

  defstruct [:changes_requested, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      changes_requested: {OpenAi.AuditLog.RateLimit.Updated.ChangesRequested, :t},
      id: {:string, :generic}
    ]
  end
end
