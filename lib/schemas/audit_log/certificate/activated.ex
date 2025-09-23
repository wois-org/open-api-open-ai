defmodule OpenAi.AuditLog.Certificate.Activated do
  @moduledoc """
  Provides struct and type for a AuditLog.Certificate.Activated
  """

  @type t :: %__MODULE__{
          certificates: [OpenAi.AuditLog.Certificate.Activated.Certificate.t()] | nil
        }

  defstruct [:certificates]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [certificates: [{OpenAi.AuditLog.Certificate.Activated.Certificate, :t}]]
  end
end
