defmodule OpenAi.AdminApiKey.List do
  @moduledoc """
  Provides struct and type for a AdminApiKey.List
  """

  @type t :: %__MODULE__{
          data: [OpenAi.AdminApiKey.t()] | nil,
          first_id: String.t() | nil,
          has_more: boolean | nil,
          last_id: String.t() | nil,
          object: String.t() | nil
        }

  defstruct [:data, :first_id, :has_more, :last_id, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{OpenAi.AdminApiKey, :t}],
      first_id: {:string, :generic},
      has_more: :boolean,
      last_id: {:string, :generic},
      object: {:string, :generic}
    ]
  end
end
