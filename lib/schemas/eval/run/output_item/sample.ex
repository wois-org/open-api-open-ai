defmodule OpenAi.Eval.Run.OutputItem.Sample do
  @moduledoc """
  Provides struct and type for a Eval.Run.OutputItem.Sample
  """

  @type t :: %__MODULE__{
          error: OpenAi.Eval.ApiError.t(),
          finish_reason: String.t(),
          input: [OpenAi.Eval.Run.OutputItem.Sample.Input.t()],
          max_completion_tokens: integer,
          model: String.t(),
          output: [OpenAi.Eval.Run.OutputItem.Sample.Output.t()],
          seed: integer,
          temperature: number,
          top_p: number,
          usage: OpenAi.Eval.Run.OutputItem.Sample.Usage.t()
        }

  defstruct [
    :error,
    :finish_reason,
    :input,
    :max_completion_tokens,
    :model,
    :output,
    :seed,
    :temperature,
    :top_p,
    :usage
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      error: {OpenAi.Eval.ApiError, :t},
      finish_reason: {:string, :generic},
      input: [{OpenAi.Eval.Run.OutputItem.Sample.Input, :t}],
      max_completion_tokens: :integer,
      model: {:string, :generic},
      output: [{OpenAi.Eval.Run.OutputItem.Sample.Output, :t}],
      seed: :integer,
      temperature: :number,
      top_p: :number,
      usage: {OpenAi.Eval.Run.OutputItem.Sample.Usage, :t}
    ]
  end
end
