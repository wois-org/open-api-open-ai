defmodule OpenAi.VectorStore.SearchResult.Item do
  @moduledoc """
  Provides struct and type for a VectorStore.SearchResult.Item
  """

  @type t :: %__MODULE__{
          attributes: OpenAi.VectorStore.File.Attributes.t(),
          content: [OpenAi.VectorStore.SearchResult.Content.t()],
          file_id: String.t(),
          filename: String.t(),
          score: number
        }

  defstruct [:attributes, :content, :file_id, :filename, :score]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {OpenAi.VectorStore.File.Attributes, :t},
      content: [{OpenAi.VectorStore.SearchResult.Content, :t}],
      file_id: {:string, :generic},
      filename: {:string, :generic},
      score: :number
    ]
  end
end
