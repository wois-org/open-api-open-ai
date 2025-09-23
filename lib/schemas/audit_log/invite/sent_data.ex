defmodule OpenAi.AuditLog.Invite.SentData do
  @moduledoc """
  Provides struct and type for a AuditLog.Invite.SentData
  """

  @type t :: %__MODULE__{email: String.t() | nil, role: String.t() | nil}

  defstruct [:email, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [email: {:string, :generic}, role: {:string, :generic}]
  end
end
