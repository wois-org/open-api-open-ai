defmodule OpenAi.VectorStore.CreateRequest do
  @moduledoc """
  Provides struct and type for a VectorStore.CreateRequest
  """

  @type t :: %__MODULE__{
          chunking_strategy:
            OpenAi.VectorStore.File.ChunkingStrategy.Auto.RequestParam.t()
            | OpenAi.VectorStore.File.ChunkingStrategy.Static.RequestParam.t()
            | nil,
          expires_after: OpenAi.VectorStore.ExpirationAfter.t() | nil,
          file_ids: [String.t()] | nil,
          metadata: map | nil,
          name: String.t() | nil
        }

  defstruct [:chunking_strategy, :expires_after, :file_ids, :metadata, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      chunking_strategy:
        {:union,
         [
           {OpenAi.VectorStore.File.ChunkingStrategy.Auto.RequestParam, :t},
           {OpenAi.VectorStore.File.ChunkingStrategy.Static.RequestParam, :t}
         ]},
      expires_after: {OpenAi.VectorStore.ExpirationAfter, :t},
      file_ids: [string: :generic],
      metadata: :map,
      name: {:string, :generic}
    ]
  end
end
