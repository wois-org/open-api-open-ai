defmodule OpenAi.VectorStore.File.ChunkingStrategy.Static.ResponseParam do
  @moduledoc """
  Provides struct and type for a VectorStore.File.ChunkingStrategy.Static.ResponseParam
  """

  @type t :: %__MODULE__{
          static: OpenAi.VectorStore.File.ChunkingStrategy.Static.t(),
          type: String.t()
        }

  defstruct [:static, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [static: {OpenAi.VectorStore.File.ChunkingStrategy.Static, :t}, type: {:const, "static"}]
  end
end
