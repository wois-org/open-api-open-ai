defmodule OpenAi.AuditLog.Actor.User do
  @moduledoc """
  Provides struct and type for a AuditLog.Actor.User
  """

  @type t :: %__MODULE__{email: String.t() | nil, id: String.t() | nil}

  defstruct [:email, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [email: {:string, :generic}, id: {:string, :generic}]
  end
end
