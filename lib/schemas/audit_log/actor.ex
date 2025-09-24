defmodule OpenAi.AuditLog.Actor do
  @moduledoc """
  Provides struct and type for a AuditLog.Actor
  """

  @type t :: %__MODULE__{
          api_key: OpenAi.AuditLog.Actor.ApiKey.t() | nil,
          session: OpenAi.AuditLog.Actor.Session.t() | nil,
          type: String.t() | nil
        }

  defstruct [:api_key, :session, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      api_key: {OpenAi.AuditLog.Actor.ApiKey, :t},
      session: {OpenAi.AuditLog.Actor.Session, :t},
      type: {:enum, ["session", "api_key"]}
    ]
  end
end
