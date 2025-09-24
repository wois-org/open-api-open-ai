defmodule OpenAi.Eval.Run.OutputItem.Sample.Usage do
  @moduledoc """
  Provides struct and type for a Eval.Run.OutputItem.Sample.Usage
  """

  @type t :: %__MODULE__{
          cached_tokens: integer,
          completion_tokens: integer,
          prompt_tokens: integer,
          total_tokens: integer
        }

  defstruct [:cached_tokens, :completion_tokens, :prompt_tokens, :total_tokens]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cached_tokens: :integer,
      completion_tokens: :integer,
      prompt_tokens: :integer,
      total_tokens: :integer
    ]
  end
end
