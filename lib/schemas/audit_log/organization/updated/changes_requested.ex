defmodule OpenAi.AuditLog.Organization.Updated.ChangesRequested do
  @moduledoc """
  Provides struct and type for a AuditLog.Organization.Updated.ChangesRequested
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          name: String.t() | nil,
          settings: OpenAi.AuditLog.Organization.Updated.ChangesRequestedSettings.t() | nil,
          title: String.t() | nil
        }

  defstruct [:description, :name, :settings, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      name: {:string, :generic},
      settings: {OpenAi.AuditLog.Organization.Updated.ChangesRequestedSettings, :t},
      title: {:string, :generic}
    ]
  end
end
