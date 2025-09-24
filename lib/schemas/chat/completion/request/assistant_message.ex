defmodule OpenAi.Chat.Completion.Request.AssistantMessage do
  @moduledoc """
  Provides struct and type for a Chat.Completion.Request.AssistantMessage
  """

  @type t :: %__MODULE__{
          audio: OpenAi.Chat.Completion.Request.AssistantMessageAudio.t() | nil,
          content: String.t() | [map] | nil,
          function_call: OpenAi.Chat.Completion.Request.AssistantMessageFunctionCall.t() | nil,
          name: String.t() | nil,
          refusal: String.t() | nil,
          role: String.t(),
          tool_calls: [OpenAi.Chat.Completion.MessageTool.Call.t()] | nil
        }

  defstruct [:audio, :content, :function_call, :name, :refusal, :role, :tool_calls]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      audio: {OpenAi.Chat.Completion.Request.AssistantMessageAudio, :t},
      content: {:union, [{:string, :generic}, [:map]]},
      function_call: {OpenAi.Chat.Completion.Request.AssistantMessageFunctionCall, :t},
      name: {:string, :generic},
      refusal: {:string, :generic},
      role: {:const, "assistant"},
      tool_calls: [{OpenAi.Chat.Completion.MessageTool.Call, :t}]
    ]
  end
end
