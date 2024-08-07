defmodule OpenAi.Run.ToolCall.Function do
  @moduledoc """
  Provides struct and type for a Run.ToolCall.Function
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
