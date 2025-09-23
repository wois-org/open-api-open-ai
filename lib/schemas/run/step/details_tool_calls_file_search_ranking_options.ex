defmodule OpenAi.Run.Step.DetailsToolCallsFileSearchRankingOptions do
  @moduledoc """
  Provides struct and type for a Run.Step.DetailsToolCallsFileSearchRankingOptions
  """

  @type t :: %__MODULE__{ranker: String.t(), score_threshold: number}

  defstruct [:ranker, :score_threshold]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ranker: {:enum, ["auto", "default_2024_08_21"]}, score_threshold: :number]
  end
end
