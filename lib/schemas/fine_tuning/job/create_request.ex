defmodule OpenAi.FineTuning.Job.CreateRequest do
  @moduledoc """
  Provides struct and type for a FineTuning.Job.CreateRequest
  """

  @type t :: %__MODULE__{
          hyperparameters: OpenAi.FineTuning.Job.CreateRequest.Hyperparameters.t() | nil,
          integrations: [OpenAi.FineTuning.Job.CreateRequest.Integrations.t()] | nil,
          model: String.t(),
          seed: integer | nil,
          suffix: String.t() | nil,
          training_file: String.t(),
          validation_file: String.t() | nil
        }

  defstruct [
    :hyperparameters,
    :integrations,
    :model,
    :seed,
    :suffix,
    :training_file,
    :validation_file
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      hyperparameters: {OpenAi.FineTuning.Job.CreateRequest.Hyperparameters, :t},
      integrations: [{OpenAi.FineTuning.Job.CreateRequest.Integrations, :t}],
      model: {:union, enum: ["babbage-002", "davinci-002", "gpt-3.5-turbo"], string: :generic},
      seed: :integer,
      suffix: {:string, :generic},
      training_file: {:string, :generic},
      validation_file: {:string, :generic}
    ]
  end
end
