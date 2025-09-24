defmodule OpenAi.Response.FileSearch.Tool do
  @moduledoc """
  Provides struct and type for a Response.FileSearch.Tool
  """

  @type t :: %__MODULE__{
          filters: OpenAi.Tool.Filter.Comparison.t() | OpenAi.Tool.Filter.Compound.t() | nil,
          max_num_results: integer | nil,
          ranking_options: OpenAi.Response.FileSearch.Tool.RankingOptions.t() | nil,
          type: String.t(),
          vector_store_ids: [String.t()]
        }

  defstruct [:filters, :max_num_results, :ranking_options, :type, :vector_store_ids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      filters:
        {:union, [{OpenAi.Tool.Filter.Comparison, :t}, {OpenAi.Tool.Filter.Compound, :t}, :null]},
      max_num_results: :integer,
      ranking_options: {OpenAi.Response.FileSearch.Tool.RankingOptions, :t},
      type: {:const, "file_search"},
      vector_store_ids: [string: :generic]
    ]
  end
end
