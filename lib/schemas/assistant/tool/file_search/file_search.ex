defmodule OpenAi.Assistant.Tool.FileSearch.FileSearch do
  @moduledoc """
  Provides struct and type for a Assistant.Tool.FileSearch.FileSearch
  """

  @type t :: %__MODULE__{
          max_num_results: integer | nil,
          ranking_options: OpenAi.Response.FileSearch.RankingOptions.t() | nil
        }

  defstruct [:max_num_results, :ranking_options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [max_num_results: :integer, ranking_options: {OpenAi.Response.FileSearch.RankingOptions, :t}]
  end
end
