defmodule OpenAi.Eval.Run.CreateRequest do
  @moduledoc """
  Provides struct and type for a Eval.Run.CreateRequest
  """

  @type t :: %__MODULE__{
          data_source:
            OpenAi.Eval.Completions.RunDataSource.Create.t()
            | OpenAi.Eval.Jsonl.RunDataSource.Create.t()
            | OpenAi.Eval.Responses.RunDataSource.Create.t(),
          metadata: map | nil,
          name: String.t() | nil
        }

  defstruct [:data_source, :metadata, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data_source:
        {:union,
         [
           {OpenAi.Eval.Completions.RunDataSource.Create, :t},
           {OpenAi.Eval.Jsonl.RunDataSource.Create, :t},
           {OpenAi.Eval.Responses.RunDataSource.Create, :t}
         ]},
      metadata: :map,
      name: {:string, :generic}
    ]
  end
end
