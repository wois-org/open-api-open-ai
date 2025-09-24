defmodule OpenAi.Response.Function.Call.ArgumentsDeltaEvent do
  @moduledoc """
  Provides struct and type for a Response.Function.Call.ArgumentsDeltaEvent
  """

  @type t :: %__MODULE__{
          delta: String.t(),
          item_id: String.t(),
          output_index: integer,
          type: String.t()
        }

  defstruct [:delta, :item_id, :output_index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      delta: {:string, :generic},
      item_id: {:string, :generic},
      output_index: :integer,
      type: {:const, "response.function_call_arguments.delta"}
    ]
  end
end
