defmodule OpenAi.AuditLog.User.Added do
  @moduledoc """
  Provides struct and type for a AuditLog.User.Added
  """

  @type t :: %__MODULE__{data: OpenAi.AuditLog.User.Added.Data.t() | nil, id: String.t() | nil}

  defstruct [:data, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {OpenAi.AuditLog.User.Added.Data, :t}, id: {:string, :generic}]
  end
end
