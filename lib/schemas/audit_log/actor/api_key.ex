defmodule OpenAi.AuditLog.Actor.ApiKey do
  @moduledoc """
  Provides struct and type for a AuditLog.Actor.ApiKey
  """

  @type t :: %__MODULE__{
          id: String.t() | nil,
          service_account: OpenAi.AuditLog.Actor.ServiceAccount.t() | nil,
          type: String.t() | nil,
          user: OpenAi.AuditLog.Actor.User.t() | nil
        }

  defstruct [:id, :service_account, :type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      service_account: {OpenAi.AuditLog.Actor.ServiceAccount, :t},
      type: {:enum, ["user", "service_account"]},
      user: {OpenAi.AuditLog.Actor.User, :t}
    ]
  end
end
