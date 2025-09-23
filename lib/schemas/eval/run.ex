defmodule OpenAi.Eval.Run do
  @moduledoc """
  Provides struct and type for a Eval.Run
  """

  @type t :: %__MODULE__{
          created_at: integer,
          data_source:
            OpenAi.Eval.Completions.RunDataSource.Create.t()
            | OpenAi.Eval.Jsonl.RunDataSource.Create.t()
            | OpenAi.Eval.Responses.RunDataSource.Create.t(),
          error: OpenAi.Eval.ApiError.t(),
          eval_id: String.t(),
          id: String.t(),
          metadata: map,
          model: String.t(),
          name: String.t(),
          object: String.t(),
          per_model_usage: [OpenAi.Eval.Run.PerModelUsage.t()],
          per_testing_criteria_results: [OpenAi.Eval.Run.PerTestingCriteriaResult.t()],
          report_url: String.t(),
          result_counts: OpenAi.Eval.Run.ResultCounts.t(),
          status: String.t()
        }

  defstruct [
    :created_at,
    :data_source,
    :error,
    :eval_id,
    :id,
    :metadata,
    :model,
    :name,
    :object,
    :per_model_usage,
    :per_testing_criteria_results,
    :report_url,
    :result_counts,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      data_source:
        {:union,
         [
           {OpenAi.Eval.Completions.RunDataSource.Create, :t},
           {OpenAi.Eval.Jsonl.RunDataSource.Create, :t},
           {OpenAi.Eval.Responses.RunDataSource.Create, :t}
         ]},
      error: {OpenAi.Eval.ApiError, :t},
      eval_id: {:string, :generic},
      id: {:string, :generic},
      metadata: :map,
      model: {:string, :generic},
      name: {:string, :generic},
      object: {:const, "eval.run"},
      per_model_usage: [{OpenAi.Eval.Run.PerModelUsage, :t}],
      per_testing_criteria_results: [{OpenAi.Eval.Run.PerTestingCriteriaResult, :t}],
      report_url: {:string, :generic},
      result_counts: {OpenAi.Eval.Run.ResultCounts, :t},
      status: {:string, :generic}
    ]
  end
end
