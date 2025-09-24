defmodule OpenAi.VectorStore.File do
  @moduledoc """
  Provides struct and type for a VectorStore.File
  """

  @type t :: %__MODULE__{
          attributes: OpenAi.VectorStore.File.Attributes.t() | nil,
          chunking_strategy:
            OpenAi.VectorStore.File.ChunkingStrategy.Other.ResponseParam.t()
            | OpenAi.VectorStore.File.ChunkingStrategy.Static.ResponseParam.t()
            | nil,
          created_at: integer,
          id: String.t(),
          last_error: OpenAi.VectorStore.File.LastError.t() | nil,
          object: String.t(),
          status: String.t(),
          usage_bytes: integer,
          vector_store_id: String.t()
        }

  defstruct [
    :attributes,
    :chunking_strategy,
    :created_at,
    :id,
    :last_error,
    :object,
    :status,
    :usage_bytes,
    :vector_store_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {OpenAi.VectorStore.File.Attributes, :t},
      chunking_strategy:
        {:union,
         [
           {OpenAi.VectorStore.File.ChunkingStrategy.Other.ResponseParam, :t},
           {OpenAi.VectorStore.File.ChunkingStrategy.Static.ResponseParam, :t}
         ]},
      created_at: :integer,
      id: {:string, :generic},
      last_error: {OpenAi.VectorStore.File.LastError, :t},
      object: {:const, "vector_store.file"},
      status: {:enum, ["in_progress", "completed", "cancelled", "failed"]},
      usage_bytes: :integer,
      vector_store_id: {:string, :generic}
    ]
  end
end
