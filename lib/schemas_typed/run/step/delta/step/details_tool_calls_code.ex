defmodule OpenAi.Run.Step.Delta.Step.DetailsToolCallsCode do
  @moduledoc """
  Provides struct and type for a Run.Step.Delta.Step.DetailsToolCallsCode

  RunStepDeltaStepDetailsToolCallsCodeObject:
    title: Code interpreter tool call
    type: object
    description: Details of the Code Interpreter tool call the run step was involved in.
    properties:
        index:
            type: integer
            description: The index of the tool call in the tool calls array.
        id:
            type: string
            description: The ID of the tool call.
        type:
            type: string
            description: The type of tool call. This is always going to be `code_interpreter` for this type of tool call.
            enum: ["code_interpreter"]
        code_interpreter:
            type: object
            description: The Code Interpreter tool call definition.
            properties:
                input:
                    type: string
                    description: The input to the Code Interpreter tool call.
                outputs:
                    type: array
                    description: The outputs from the Code Interpreter tool call. Code Interpreter can output one or more items, including text (`logs`) or images (`image`). Each of these are represented by a different object type.
                    items:
                        type: object
                        oneOf:
                            - $ref: "#/components/schemas/RunStepDeltaStepDetailsToolCallsCodeOutputLogsObject"
                            - $ref: "#/components/schemas/RunStepDeltaStepDetailsToolCallsCodeOutputImageObject"
                        x-oaiExpandable: true
    required:
        - index
        - type
  """

  @type t :: %__MODULE__{
          code_interpreter: OpenAi.Run.Step.Delta.Step.DetailsToolCallsCodeCodeInterpreter.t(),
          id: String.t(),
          index: integer(),
          type: String.t()
        }

  defstruct [:code_interpreter, :id, :index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {OpenAi.Run.Step.Delta.Step.DetailsToolCallsCodeCodeInterpreter, :t},
      id: {:string, :generic},
      index: :integer,
      type: {:const, "code_interpreter"}
    ]
  end
end
