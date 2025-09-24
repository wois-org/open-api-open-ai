defmodule OpenAi.Eval.Run.OutputItem do
  @moduledoc """
  Provides struct and type for a Eval.Run.OutputItem
  """

  @type t :: %__MODULE__{
          created_at: integer,
          datasource_item: map,
          datasource_item_id: integer,
          eval_id: String.t(),
          id: String.t(),
          object: String.t(),
          results: [map],
          run_id: String.t(),
          sample: OpenAi.Eval.Run.OutputItem.Sample.t(),
          status: String.t()
        }

  defstruct [
    :created_at,
    :datasource_item,
    :datasource_item_id,
    :eval_id,
    :id,
    :object,
    :results,
    :run_id,
    :sample,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      datasource_item: :map,
      datasource_item_id: :integer,
      eval_id: {:string, :generic},
      id: {:string, :generic},
      object: {:const, "eval.run.output_item"},
      results: [:map],
      run_id: {:string, :generic},
      sample: {OpenAi.Eval.Run.OutputItem.Sample, :t},
      status: {:string, :generic}
    ]
  end
end
