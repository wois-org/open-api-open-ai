defmodule OpenAi.Eval.TextSimilarityGrader do
  @moduledoc """
  Provides struct and type for a Eval.TextSimilarityGrader
  """

  @type t :: %__MODULE__{
          evaluation_metric: String.t(),
          input: String.t(),
          name: String.t() | nil,
          pass_threshold: number,
          reference: String.t(),
          type: String.t()
        }

  defstruct [:evaluation_metric, :input, :name, :pass_threshold, :reference, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      evaluation_metric:
        {:enum,
         [
           "fuzzy_match",
           "bleu",
           "gleu",
           "meteor",
           "rouge_1",
           "rouge_2",
           "rouge_3",
           "rouge_4",
           "rouge_5",
           "rouge_l"
         ]},
      input: {:string, :generic},
      name: {:string, :generic},
      pass_threshold: :number,
      reference: {:string, :generic},
      type: {:const, "text_similarity"}
    ]
  end
end
