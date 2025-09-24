defmodule OpenAi.Certificate do
  @moduledoc """
  Provides struct and type for a Certificate
  """

  @type t :: %__MODULE__{
          active: boolean | nil,
          certificate_details: OpenAi.Certificate.CertificateDetails.t(),
          created_at: integer,
          id: String.t(),
          name: String.t(),
          object: String.t()
        }

  defstruct [:active, :certificate_details, :created_at, :id, :name, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      active: :boolean,
      certificate_details: {OpenAi.Certificate.CertificateDetails, :t},
      created_at: :integer,
      id: {:string, :generic},
      name: {:string, :generic},
      object:
        {:enum, ["certificate", "organization.certificate", "organization.project.certificate"]}
    ]
  end
end
