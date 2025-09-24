defmodule OpenAi.Project.ApiKey do
  @moduledoc """
  Provides struct and type for a Project.ApiKey
  """

  @type t :: %__MODULE__{
          created_at: integer,
          id: String.t(),
          last_used_at: integer,
          name: String.t(),
          object: String.t(),
          owner: OpenAi.Project.ApiKey.Owner.t(),
          redacted_value: String.t()
        }

  defstruct [:created_at, :id, :last_used_at, :name, :object, :owner, :redacted_value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      id: {:string, :generic},
      last_used_at: :integer,
      name: {:string, :generic},
      object: {:const, "organization.project.api_key"},
      owner: {OpenAi.Project.ApiKey.Owner, :t},
      redacted_value: {:string, :generic}
    ]
  end
end
