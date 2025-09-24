defmodule OpenAi.Eval.InputMessage.ItemReference do
  @moduledoc """
  Provides struct and type for a Eval.InputMessage.ItemReference
  """

  @type t :: %__MODULE__{item_reference: String.t(), type: String.t()}

  defstruct [:item_reference, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [item_reference: {:string, :generic}, type: {:const, "item_reference"}]
  end
end
