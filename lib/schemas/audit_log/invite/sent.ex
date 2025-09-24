defmodule OpenAi.AuditLog.Invite.Sent do
  @moduledoc """
  Provides struct and type for a AuditLog.Invite.Sent
  """

  @type t :: %__MODULE__{data: OpenAi.AuditLog.Invite.SentData.t() | nil, id: String.t() | nil}

  defstruct [:data, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {OpenAi.AuditLog.Invite.SentData, :t}, id: {:string, :generic}]
  end
end
