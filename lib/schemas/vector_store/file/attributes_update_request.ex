defmodule OpenAi.VectorStore.File.AttributesUpdateRequest do
  @moduledoc """
  Provides struct and type for a VectorStore.File.AttributesUpdateRequest
  """

  @type t :: %__MODULE__{attributes: OpenAi.VectorStore.File.Attributes.t()}

  defstruct [:attributes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attributes: {OpenAi.VectorStore.File.Attributes, :t}]
  end
end
