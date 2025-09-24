defmodule OpenAi.AuditLog.Certificate.Deleted do
  @moduledoc """
  Provides struct and type for a AuditLog.Certificate.Deleted
  """

  @type t :: %__MODULE__{
          certificate: String.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil
        }

  defstruct [:certificate, :id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [certificate: {:string, :generic}, id: {:string, :generic}, name: {:string, :generic}]
  end
end
