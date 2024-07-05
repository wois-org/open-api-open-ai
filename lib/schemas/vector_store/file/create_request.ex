defmodule OpenAi.VectorStore.File.CreateRequest do
  @moduledoc """
  Provides struct and type for a VectorStore.File.CreateRequest
  """

  @type t :: %__MODULE__{
          chunking_strategy:
            OpenAi.VectorStore.File.ChunkingStrategy.Auto.RequestParam.t()
            | OpenAi.VectorStore.File.ChunkingStrategy.Static.RequestParam.t()
            | nil,
          file_id: String.t()
        }

  defstruct [:chunking_strategy, :file_id]

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
      file_id: {:string, :generic}
    ]
  end
end
