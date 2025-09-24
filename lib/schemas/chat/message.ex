defmodule OpenAi.Chat.Message do
  @moduledoc """
  Provides struct and type for a Chat.Message
  """

  @type t :: %__MODULE__{content: String.t(), role: String.t()}

  defstruct [:content, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [content: {:string, :generic}, role: {:string, :generic}]
  end
end
