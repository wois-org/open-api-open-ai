defmodule OpenAi.AdminApiKey do
  @moduledoc """
  Provides struct and type for a AdminApiKey
  """

  @type t :: %__MODULE__{
          created_at: integer,
          id: String.t(),
          last_used_at: integer | nil,
          name: String.t(),
          object: String.t(),
          owner: OpenAi.AdminApiKey.Owner.t(),
          redacted_value: String.t(),
          value: String.t() | nil
        }

  defstruct [:created_at, :id, :last_used_at, :name, :object, :owner, :redacted_value, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      id: {:string, :generic},
      last_used_at: :integer,
      name: {:string, :generic},
      object: {:string, :generic},
      owner: {OpenAi.AdminApiKey.Owner, :t},
      redacted_value: {:string, :generic},
      value: {:string, :generic}
    ]
  end
end
