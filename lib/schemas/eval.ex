defmodule OpenAi.Eval do
  @moduledoc """
  Provides struct and type for a Eval
  """

  @type t :: %__MODULE__{
          created_at: integer,
          data_source_config:
            OpenAi.Eval.CustomDataSource.Config.t()
            | OpenAi.Eval.StoredCompletions.DataSourceConfig.t(),
          id: String.t(),
          metadata: map,
          name: String.t(),
          object: String.t(),
          testing_criteria: [
            OpenAi.Eval.LabelModelGrader.t()
            | OpenAi.Eval.PythonGrader.t()
            | OpenAi.Eval.ScoreModelGrader.t()
            | OpenAi.Eval.StringCheckGrader.t()
            | OpenAi.Eval.TextSimilarityGrader.t()
          ]
        }

  defstruct [:created_at, :data_source_config, :id, :metadata, :name, :object, :testing_criteria]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      data_source_config:
        {:union,
         [
           {OpenAi.Eval.CustomDataSource.Config, :t},
           {OpenAi.Eval.StoredCompletions.DataSourceConfig, :t}
         ]},
      id: {:string, :generic},
      metadata: :map,
      name: {:string, :generic},
      object: {:const, "eval"},
      testing_criteria: [
        union: [
          {OpenAi.Eval.LabelModelGrader, :t},
          {OpenAi.Eval.PythonGrader, :t},
          {OpenAi.Eval.ScoreModelGrader, :t},
          {OpenAi.Eval.StringCheckGrader, :t},
          {OpenAi.Eval.TextSimilarityGrader, :t}
        ]
      ]
    ]
  end
end
