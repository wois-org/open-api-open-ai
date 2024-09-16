defmodule OpenAi.Run.Step.Delta.Step.DetailsToolCallsCodeOutput do
  @moduledoc """
  Provides struct and type for a Run.Step.Delta.Step.DetailsToolCallsCodeOutput

  RunStepDeltaStepDetailsToolCallsCodeOutputLogsObject:
    title: Code interpreter log output
    type: object
    description: Text output from the Code Interpreter tool call as part of a run step.
    properties:
        index:
            type: integer
            description: The index of the output in the outputs array.
        type:
            description: Always `logs`.
            type: string
            enum: ["logs"]
        logs:
            type: string
            description: The text output from the Code Interpreter tool call.
    required:
        - index
        - type
  """

  @type t :: %__MODULE__{
          index: integer(),
          type: String.t(),
          logs: String.t()
        }

  defstruct [:index, :type, :logs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      index: :integer,
      type: {:const, "logs"},
      logs: {:string, :generic}
    ]
  end
end
