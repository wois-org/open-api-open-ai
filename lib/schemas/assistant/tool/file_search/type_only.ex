defmodule OpenAi.Assistant.Tool.FileSearch.TypeOnly do
  @moduledoc """
  Provides struct and type for a Assistant.Tool.FileSearch.TypeOnly
  """

  @type t :: %__MODULE__{type: String.t()}

  defstruct [:type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:const, "file_search"}]
  end
end
