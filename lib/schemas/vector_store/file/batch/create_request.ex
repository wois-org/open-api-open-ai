defmodule OpenAi.VectorStore.File.Batch.CreateRequest do
  @moduledoc """
  Provides struct and type for a VectorStore.File.Batch.CreateRequest
  """

  @type t :: %__MODULE__{
          chunking_strategy:
            OpenAi.VectorStore.File.ChunkingStrategy.Auto.RequestParam.t()
            | OpenAi.VectorStore.File.ChunkingStrategy.Static.RequestParam.t()
            | nil,
          file_ids: [String.t()]
        }

  defstruct [:chunking_strategy, :file_ids]

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
      file_ids: [string: :generic]
    ]
  end
end
