defmodule OpenAi.Assistant.Tool.Outputs.RunSubmitRequest do
  @moduledoc """
  Provides struct and type for a Assistant.Tool.Outputs.RunSubmitRequest
  """

  @type t :: %__MODULE__{
          stream: boolean | nil,
          tool_outputs: [OpenAi.Assistant.Tool.Outputs.RunSubmitRequest.ToolOutputs.t()]
        }

  defstruct [:stream, :tool_outputs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      stream: :boolean,
      tool_outputs: [{OpenAi.Assistant.Tool.Outputs.RunSubmitRequest.ToolOutputs, :t}]
    ]
  end
end
