defmodule OpenAi.VectorStore.File.ContentResponse do
  @moduledoc """
  Provides struct and type for a VectorStore.File.ContentResponse
  """

  @type t :: %__MODULE__{
          data: [OpenAi.VectorStore.File.ContentResponseData.t()],
          has_more: boolean,
          next_page: String.t() | nil,
          object: String.t()
        }

  defstruct [:data, :has_more, :next_page, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{OpenAi.VectorStore.File.ContentResponseData, :t}],
      has_more: :boolean,
      next_page: {:string, :generic},
      object: {:const, "vector_store.file_content.page"}
    ]
  end
end
