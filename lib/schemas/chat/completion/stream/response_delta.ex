defmodule OpenAi.Chat.Completion.Stream.ResponseDelta do
  @moduledoc """
  Provides struct and type for a Chat.Completion.Stream.ResponseDelta
  """

  @type t :: %__MODULE__{
          content: String.t() | nil,
          function_call: OpenAi.Chat.Completion.Stream.ResponseDelta.FunctionCall.t() | nil,
          refusal: String.t() | nil,
          role: String.t() | nil,
          tool_calls: [OpenAi.Chat.Completion.MessageTool.CallChunk.t()] | nil
        }

  defstruct [:content, :function_call, :refusal, :role, :tool_calls]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: {:string, :generic},
      function_call: {OpenAi.Chat.Completion.Stream.ResponseDelta.FunctionCall, :t},
      refusal: {:string, :generic},
      role: {:enum, ["developer", "system", "user", "assistant", "tool"]},
      tool_calls: [{OpenAi.Chat.Completion.MessageTool.CallChunk, :t}]
    ]
  end
end
