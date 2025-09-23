defmodule OpenAi.Eval.Jsonl.File.IdSource do
  @moduledoc """
  Provides struct and type for a Eval.Jsonl.File.IdSource
  """

  @type t :: %__MODULE__{id: String.t(), type: String.t()}

  defstruct [:id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, type: {:const, "file_id"}]
  end
end
