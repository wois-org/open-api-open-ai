defmodule OpenAi.Run.ToolCall do
  @moduledoc """
  Provides struct and type for a Run.ToolCall
  """

  @type t :: %__MODULE__{
          function: OpenAi.Run.ToolCall.Function.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:function, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      function: {OpenAi.Run.ToolCall.Function, :t},
      id: {:string, :generic},
      type: {:const, "function"}
    ]
  end
end
