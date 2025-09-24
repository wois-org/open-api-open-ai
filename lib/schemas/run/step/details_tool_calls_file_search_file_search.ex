defmodule OpenAi.Run.Step.DetailsToolCallsFileSearchFileSearch do
  @moduledoc """
  Provides struct and type for a Run.Step.DetailsToolCallsFileSearchFileSearch
  """

  @type t :: %__MODULE__{
          ranking_options: OpenAi.Run.Step.DetailsToolCallsFileSearchRankingOptions.t() | nil,
          results: [OpenAi.Run.Step.DetailsToolCallsFileSearchResult.t()] | nil
        }

  defstruct [:ranking_options, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ranking_options: {OpenAi.Run.Step.DetailsToolCallsFileSearchRankingOptions, :t},
      results: [{OpenAi.Run.Step.DetailsToolCallsFileSearchResult, :t}]
    ]
  end
end
