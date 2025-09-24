defmodule OpenAi.Eval.Jsonl.File.ContentSource.Content do
  @moduledoc """
  Provides struct and type for a Eval.Jsonl.File.ContentSource.Content
  """

  @type t :: %__MODULE__{item: map, sample: map | nil}

  defstruct [:item, :sample]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [item: :map, sample: :map]
  end
end
