defmodule OpenAi.VectorStore.UpdateRequest do
  @moduledoc """
  Provides struct and type for a VectorStore.UpdateRequest
  """

  @type t :: %__MODULE__{
          expires_after: OpenAi.VectorStore.ExpirationAfter.t() | nil,
          metadata: map | nil,
          name: String.t() | nil
        }

  defstruct [:expires_after, :metadata, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      expires_after: {OpenAi.VectorStore.ExpirationAfter, :t},
      metadata: :map,
      name: {:string, :generic}
    ]
  end
end
