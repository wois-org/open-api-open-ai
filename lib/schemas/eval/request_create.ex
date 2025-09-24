defmodule OpenAi.Eval.RequestCreate do
  @moduledoc """
  Provides struct and type for a Eval.RequestCreate
  """

  @type t :: %__MODULE__{
          data_source_config:
            OpenAi.Eval.CustomDataSource.Config.Create.t()
            | OpenAi.Eval.LogsDataSource.Config.Create.t(),
          metadata: map | nil,
          name: String.t() | nil,
          testing_criteria: [
            OpenAi.Eval.LabelModelGrader.Create.t()
            | OpenAi.Eval.PythonGrader.t()
            | OpenAi.Eval.ScoreModelGrader.t()
            | OpenAi.Eval.StringCheckGrader.t()
            | OpenAi.Eval.TextSimilarityGrader.t()
          ]
        }

  defstruct [:data_source_config, :metadata, :name, :testing_criteria]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data_source_config:
        {:union,
         [
           {OpenAi.Eval.CustomDataSource.Config.Create, :t},
           {OpenAi.Eval.LogsDataSource.Config.Create, :t}
         ]},
      metadata: :map,
      name: {:string, :generic},
      testing_criteria: [
        union: [
          {OpenAi.Eval.LabelModelGrader.Create, :t},
          {OpenAi.Eval.PythonGrader, :t},
          {OpenAi.Eval.ScoreModelGrader, :t},
          {OpenAi.Eval.StringCheckGrader, :t},
          {OpenAi.Eval.TextSimilarityGrader, :t}
        ]
      ]
    ]
  end
end
