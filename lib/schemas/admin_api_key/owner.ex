defmodule OpenAi.AdminApiKey.Owner do
  @moduledoc """
  Provides struct and type for a AdminApiKey.Owner
  """

  @type t :: %__MODULE__{
          created_at: integer | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          object: String.t() | nil,
          role: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:created_at, :id, :name, :object, :role, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      id: {:string, :generic},
      name: {:string, :generic},
      object: {:string, :generic},
      role: {:string, :generic},
      type: {:string, :generic}
    ]
  end
end
