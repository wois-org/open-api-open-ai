defmodule OpenAi.Eval.Jsonl.File.ContentSource do
  @moduledoc """
  Provides struct and type for a Eval.Jsonl.File.ContentSource
  """

  @type t :: %__MODULE__{
          content: [OpenAi.Eval.Jsonl.File.ContentSource.Content.t()],
          type: String.t()
        }

  defstruct [:content, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: [{OpenAi.Eval.Jsonl.File.ContentSource.Content, :t}],
      type: {:const, "file_content"}
    ]
  end
end
