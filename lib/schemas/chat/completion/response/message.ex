defmodule OpenAi.Chat.Completion.Response.Message do
  @moduledoc """
  Provides struct and type for a Chat.Completion.Response.Message
  """

  @type t :: %__MODULE__{
          content: String.t() | nil,
          function_call: OpenAi.Chat.Completion.Response.MessageFunctionCall.t() | nil,
          role: String.t(),
          tool_calls: [OpenAi.Chat.Completion.MessageTool.Call.t()] | nil
        }

  defstruct [:content, :function_call, :role, :tool_calls]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: {:string, :generic},
      function_call: {OpenAi.Chat.Completion.Response.MessageFunctionCall, :t},
      role: {:const, "assistant"},
      tool_calls: [{OpenAi.Chat.Completion.MessageTool.Call, :t}]
    ]
  end
end
