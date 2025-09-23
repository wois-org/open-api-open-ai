defmodule OpenAi.AuditLog.User.Added.Data do
  @moduledoc """
  Provides struct and type for a AuditLog.User.Added.Data
  """

  @type t :: %__MODULE__{role: String.t() | nil}

  defstruct [:role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [role: {:string, :generic}]
  end
end
