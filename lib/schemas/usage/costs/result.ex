defmodule OpenAi.Usage.Costs.Result do
  @moduledoc """
  Provides struct and type for a Usage.Costs.Result
  """

  @type t :: %__MODULE__{
          amount: OpenAi.Usage.Costs.ResultAmount.t() | nil,
          line_item: String.t() | nil,
          object: String.t(),
          project_id: String.t() | nil
        }

  defstruct [:amount, :line_item, :object, :project_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: {OpenAi.Usage.Costs.ResultAmount, :t},
      line_item: {:string, :generic},
      object: {:const, "organization.costs.result"},
      project_id: {:string, :generic}
    ]
  end
end
