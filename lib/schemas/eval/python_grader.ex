defmodule OpenAi.Eval.PythonGrader do
  @moduledoc """
  Provides struct and type for a Eval.PythonGrader
  """

  @type t :: %__MODULE__{
          image_tag: String.t() | nil,
          name: String.t(),
          pass_threshold: number | nil,
          source: String.t(),
          type: String.t()
        }

  defstruct [:image_tag, :name, :pass_threshold, :source, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      image_tag: {:string, :generic},
      name: {:string, :generic},
      pass_threshold: :number,
      source: {:string, :generic},
      type: {:const, "python"}
    ]
  end
end
