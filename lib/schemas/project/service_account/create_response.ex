defmodule OpenAi.Project.ServiceAccount.CreateResponse do
  @moduledoc """
  Provides struct and type for a Project.ServiceAccount.CreateResponse
  """

  @type t :: %__MODULE__{
          api_key: OpenAi.Project.ServiceAccount.ApiKey.t(),
          created_at: integer,
          id: String.t(),
          name: String.t(),
          object: String.t(),
          role: String.t()
        }

  defstruct [:api_key, :created_at, :id, :name, :object, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      api_key: {OpenAi.Project.ServiceAccount.ApiKey, :t},
      created_at: :integer,
      id: {:string, :generic},
      name: {:string, :generic},
      object: {:const, "organization.project.service_account"},
      role: {:const, "member"}
    ]
  end
end
