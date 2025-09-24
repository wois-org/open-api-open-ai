defmodule OpenAi.FineTuning.Method do
  @moduledoc """
  Provides struct and type for a FineTuning.Method
  """

  @type t :: %__MODULE__{
          dpo: OpenAi.FineTuning.DPOMethod.t() | nil,
          supervised: OpenAi.FineTuning.SupervisedMethod.t() | nil,
          type: String.t() | nil
        }

  defstruct [:dpo, :supervised, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dpo: {OpenAi.FineTuning.DPOMethod, :t},
      supervised: {OpenAi.FineTuning.SupervisedMethod, :t},
      type: {:enum, ["supervised", "dpo"]}
    ]
  end
end
