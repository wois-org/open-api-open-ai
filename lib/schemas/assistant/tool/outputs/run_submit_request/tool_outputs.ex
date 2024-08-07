defmodule OpenAi.Assistant.Tool.Outputs.RunSubmitRequest.ToolOutputs do
  @moduledoc """
  Provides struct and type for a Assistant.Tool.Outputs.RunSubmitRequest.ToolOutputs
  """

  @type t :: %__MODULE__{output: String.t() | nil, tool_call_id: String.t() | nil}

  defstruct [:output, :tool_call_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [output: {:string, :generic}, tool_call_id: {:string, :generic}]
  end
end
