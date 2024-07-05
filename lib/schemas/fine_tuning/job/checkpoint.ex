defmodule OpenAi.FineTuning.Job.Checkpoint do
  @moduledoc """
  Provides struct and type for a FineTuning.Job.Checkpoint
  """

  @type t :: %__MODULE__{
          created_at: integer,
          fine_tuned_model_checkpoint: String.t(),
          fine_tuning_job_id: String.t(),
          id: String.t(),
          metrics: OpenAi.FineTuning.Job.Checkpoint.Metrics.t(),
          object: String.t(),
          step_number: integer
        }

  defstruct [
    :created_at,
    :fine_tuned_model_checkpoint,
    :fine_tuning_job_id,
    :id,
    :metrics,
    :object,
    :step_number
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      fine_tuned_model_checkpoint: {:string, :generic},
      fine_tuning_job_id: {:string, :generic},
      id: {:string, :generic},
      metrics: {OpenAi.FineTuning.Job.Checkpoint.Metrics, :t},
      object: {:const, "fine_tuning.job.checkpoint"},
      step_number: :integer
    ]
  end
end
