defmodule OpenAi.Chat.Completion.Request.ToolMessage do
  @moduledoc """
  Provides struct and type for a Chat.Completion.Request.ToolMessage
  """

  @type t :: %__MODULE__{content: String.t(), role: String.t(), tool_call_id: String.t()}

  defstruct [:content, :role, :tool_call_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [content: {:string, :generic}, role: {:const, "tool"}, tool_call_id: {:string, :generic}]
  end
end
