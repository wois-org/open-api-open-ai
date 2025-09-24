defmodule OpenAi.Eval.Jsonl.RunDataSource.Create do
  @moduledoc """
  Provides struct and type for a Eval.Jsonl.RunDataSource.Create
  """

  @type t :: %__MODULE__{
          source: OpenAi.Eval.Jsonl.File.ContentSource.t() | OpenAi.Eval.Jsonl.File.IdSource.t(),
          type: String.t()
        }

  defstruct [:source, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      source:
        {:union,
         [{OpenAi.Eval.Jsonl.File.ContentSource, :t}, {OpenAi.Eval.Jsonl.File.IdSource, :t}]},
      type: {:const, "jsonl"}
    ]
  end
end
