defmodule OpenAi.Eval.LabelModelGrader do
  @moduledoc """
  Provides struct and type for a Eval.LabelModelGrader
  """

  @type t :: %__MODULE__{
          input: [OpenAi.Eval.Item.t()],
          labels: [String.t()],
          model: String.t(),
          name: String.t(),
          passing_labels: [String.t()],
          type: String.t()
        }

  defstruct [:input, :labels, :model, :name, :passing_labels, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input: [{OpenAi.Eval.Item, :t}],
      labels: [string: :generic],
      model: {:string, :generic},
      name: {:string, :generic},
      passing_labels: [string: :generic],
      type: {:const, "label_model"}
    ]
  end
end
