defmodule OpenAi.Thread.ToolResources.FileSearch do
  @moduledoc """
  Provides struct and type for a Thread.ToolResources.FileSearch
  """

  @type t :: %__MODULE__{vector_store_ids: [String.t()] | nil}

  defstruct [:vector_store_ids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [vector_store_ids: [string: :generic]]
  end
end
