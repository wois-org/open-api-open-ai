defmodule OpenAi.Run.RequiredAction.SubmitToolOutputs do
  @moduledoc """
  Provides struct and type for a Run.RequiredAction.SubmitToolOutputs
  """

  @type t :: %__MODULE__{tool_calls: [OpenAi.Run.ToolCall.t()]}

  defstruct [:tool_calls]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tool_calls: [{OpenAi.Run.ToolCall, :t}]]
  end
end
