defmodule OpenAi.AuditLog.Actor.Session do
  @moduledoc """
  Provides struct and type for a AuditLog.Actor.Session
  """

  @type t :: %__MODULE__{ip_address: String.t() | nil, user: OpenAi.AuditLog.Actor.User.t() | nil}

  defstruct [:ip_address, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ip_address: {:string, :generic}, user: {OpenAi.AuditLog.Actor.User, :t}]
  end
end
