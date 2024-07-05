defmodule OpenAi.Chat.Completion.Tool do
  @moduledoc """
  Provides struct and type for a Chat.Completion.Tool
  """

  @type t :: %__MODULE__{function: OpenAi.Function.t(), type: String.t()}

  defstruct [:function, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [function: {OpenAi.Function, :t}, type: {:const, "function"}]
  end
end
