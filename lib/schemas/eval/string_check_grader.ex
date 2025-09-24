defmodule OpenAi.Eval.StringCheckGrader do
  @moduledoc """
  Provides struct and type for a Eval.StringCheckGrader
  """

  @type t :: %__MODULE__{
          input: String.t(),
          name: String.t(),
          operation: String.t(),
          reference: String.t(),
          type: String.t()
        }

  defstruct [:input, :name, :operation, :reference, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input: {:string, :generic},
      name: {:string, :generic},
      operation: {:enum, ["eq", "ne", "like", "ilike"]},
      reference: {:string, :generic},
      type: {:const, "string_check"}
    ]
  end
end
