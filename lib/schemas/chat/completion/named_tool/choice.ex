defmodule OpenAi.Chat.Completion.NamedTool.Choice do
  @moduledoc """
  Provides struct and type for a Chat.Completion.NamedTool.Choice
  """

  @type t :: %__MODULE__{
          function: OpenAi.Chat.Completion.NamedTool.ChoiceFunction.t(),
          type: String.t()
        }

  defstruct [:function, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [function: {OpenAi.Chat.Completion.NamedTool.ChoiceFunction, :t}, type: {:const, "function"}]
  end
end
