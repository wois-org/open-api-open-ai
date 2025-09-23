defmodule OpenAi.Eval.Completions.RunDataSource.Create do
  @moduledoc """
  Provides struct and type for a Eval.Completions.RunDataSource.Create
  """

  @type t :: %__MODULE__{
          input_messages:
            OpenAi.Eval.InputMessage.ItemReference.t()
            | OpenAi.Eval.InputMessage.Template.t()
            | nil,
          model: String.t() | nil,
          sampling_params: OpenAi.Eval.Completions.RunDataSource.CreateSamplingParams.t() | nil,
          source:
            OpenAi.Eval.Jsonl.File.ContentSource.t()
            | OpenAi.Eval.Jsonl.File.IdSource.t()
            | OpenAi.Eval.StoredCompletions.Source.t(),
          type: String.t()
        }

  defstruct [:input_messages, :model, :sampling_params, :source, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input_messages:
        {:union,
         [{OpenAi.Eval.InputMessage.ItemReference, :t}, {OpenAi.Eval.InputMessage.Template, :t}]},
      model: {:string, :generic},
      sampling_params: {OpenAi.Eval.Completions.RunDataSource.CreateSamplingParams, :t},
      source:
        {:union,
         [
           {OpenAi.Eval.Jsonl.File.ContentSource, :t},
           {OpenAi.Eval.Jsonl.File.IdSource, :t},
           {OpenAi.Eval.StoredCompletions.Source, :t}
         ]},
      type: {:const, "completions"}
    ]
  end
end
