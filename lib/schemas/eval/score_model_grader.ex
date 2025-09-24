defmodule OpenAi.Eval.ScoreModelGrader do
  @moduledoc """
  Provides struct and type for a Eval.ScoreModelGrader
  """

  @type t :: %__MODULE__{
          input: [OpenAi.Eval.Item.t()],
          model: String.t(),
          name: String.t(),
          pass_threshold: number | nil,
          range: [number] | nil,
          sampling_params: map | nil,
          type: String.t()
        }

  defstruct [:input, :model, :name, :pass_threshold, :range, :sampling_params, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input: [{OpenAi.Eval.Item, :t}],
      model: {:string, :generic},
      name: {:string, :generic},
      pass_threshold: :number,
      range: [:number],
      sampling_params: :map,
      type: {:const, "score_model"}
    ]
  end
end
