defmodule OpenAi.AuditLog.ApiKey.Created do
  @moduledoc """
  Provides struct and type for a AuditLog.ApiKey.Created
  """

  @type t :: %__MODULE__{
          data: OpenAi.AuditLog.ApiKey.Created.Data.t() | nil,
          id: String.t() | nil
        }

  defstruct [:data, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {OpenAi.AuditLog.ApiKey.Created.Data, :t}, id: {:string, :generic}]
  end
end
