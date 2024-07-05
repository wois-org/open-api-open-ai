defmodule OpenAi.Assistant.Tool.File.SearchFileSearch do
  @moduledoc """
  Provides struct and type for a Assistant.Tool.File.SearchFileSearch
  """

  @type t :: %__MODULE__{max_num_results: integer | nil}

  defstruct [:max_num_results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [max_num_results: :integer]
  end
end
