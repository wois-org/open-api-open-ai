defmodule OpenAi.Moderation.CreateResponse.Result do
  @moduledoc """
  Provides struct and type for a Moderation.CreateResponse.Result
  """

  @type t :: %__MODULE__{
          categories: OpenAi.Moderation.CreateResponse.Result.Categories.t(),
          category_scores: OpenAi.Moderation.CreateResponse.Result.CategoryScores.t(),
          flagged: boolean
        }

  defstruct [:categories, :category_scores, :flagged]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      categories: {OpenAi.Moderation.CreateResponse.Result.Categories, :t},
      category_scores: {OpenAi.Moderation.CreateResponse.Result.CategoryScores, :t},
      flagged: :boolean
    ]
  end
end
