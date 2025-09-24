defmodule OpenAi.VectorStore.SearchRequest do
  @moduledoc """
  Provides struct and type for a VectorStore.SearchRequest
  """

  @type t :: %__MODULE__{
          filters: OpenAi.Tool.Filter.Comparison.t() | OpenAi.Tool.Filter.Compound.t() | nil,
          max_num_results: integer | nil,
          query: String.t() | [String.t()],
          ranking_options: OpenAi.VectorStore.SearchRequest.RankingOptions.t() | nil,
          rewrite_query: boolean | nil
        }

  defstruct [:filters, :max_num_results, :query, :ranking_options, :rewrite_query]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      filters: {:union, [{OpenAi.Tool.Filter.Comparison, :t}, {OpenAi.Tool.Filter.Compound, :t}]},
      max_num_results: :integer,
      query: {:union, [{:string, :generic}, [string: :generic]]},
      ranking_options: {OpenAi.VectorStore.SearchRequest.RankingOptions, :t},
      rewrite_query: :boolean
    ]
  end
end
