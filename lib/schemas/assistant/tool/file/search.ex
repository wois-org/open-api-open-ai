defmodule OpenAi.Assistant.Tool.File.Search do
  @moduledoc """
  Provides struct and type for a Assistant.Tool.File.Search
  """

  @type t :: %__MODULE__{
          file_search: OpenAi.Assistant.Tool.File.SearchFileSearch.t() | nil,
          type: String.t()
        }

  defstruct [:file_search, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      file_search: {OpenAi.Assistant.Tool.File.SearchFileSearch, :t},
      type: {:const, "file_search"}
    ]
  end
end
