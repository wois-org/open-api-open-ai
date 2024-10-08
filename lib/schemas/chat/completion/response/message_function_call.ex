defmodule OpenAi.Chat.Completion.Response.MessageFunctionCall do
  @moduledoc """
  Provides struct and type for a Chat.Completion.Response.MessageFunctionCall
  """

  @type t :: %__MODULE__{arguments: String.t(), name: String.t()}

  defstruct [:arguments, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [arguments: {:string, :generic}, name: {:string, :generic}]
  end
end
