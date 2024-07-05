defmodule OpenAi.Chat.Completion.MessageTool.Call do
  @moduledoc """
  Provides struct and type for a Chat.Completion.MessageTool.Call
  """

  @type t :: %__MODULE__{
          function: OpenAi.Chat.Completion.MessageTool.CallFunction.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:function, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      function: {OpenAi.Chat.Completion.MessageTool.CallFunction, :t},
      id: {:string, :generic},
      type: {:const, "function"}
    ]
  end
end
