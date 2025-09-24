defmodule OpenAi.Eval.Run.PerModelUsage do
  @moduledoc """
  Provides struct and type for a Eval.Run.PerModelUsage
  """

  @type t :: %__MODULE__{
          cached_tokens: integer,
          completion_tokens: integer,
          invocation_count: integer,
          model_name: String.t(),
          prompt_tokens: integer,
          total_tokens: integer
        }

  defstruct [
    :cached_tokens,
    :completion_tokens,
    :invocation_count,
    :model_name,
    :prompt_tokens,
    :total_tokens
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cached_tokens: :integer,
      completion_tokens: :integer,
      invocation_count: :integer,
      model_name: {:string, :generic},
      prompt_tokens: :integer,
      total_tokens: :integer
    ]
  end
end
