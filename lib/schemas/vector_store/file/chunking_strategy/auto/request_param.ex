defmodule OpenAi.VectorStore.File.ChunkingStrategy.Auto.RequestParam do
  @moduledoc """
  Provides struct and type for a VectorStore.File.ChunkingStrategy.Auto.RequestParam
  """

  @type t :: %__MODULE__{type: String.t()}

  defstruct [:type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:const, "auto"}]
  end
end
