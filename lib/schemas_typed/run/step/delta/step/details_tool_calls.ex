defmodule OpenAi.Run.Step.Delta.Step.DetailsToolCalls do
  @moduledoc """
  Provides struct and type for a Run.Step.Delta.Step.DetailsToolCalls

  RunStepDeltaStepDetailsToolCallsObject:
      title: Tool calls
      type: object
      description: Details of the tool call.
      properties:
          type:
              description: Always `tool_calls`.
              type: string
              enum: ["tool_calls"]
          tool_calls:
              type: array
              description: |
                  An array of tool calls the run step was involved in. These can be associated with one of three types of tools: `code_interpreter`, `file_search`, or `function`.
              items:
                  oneOf:
                      - $ref: "#/components/schemas/RunStepDeltaStepDetailsToolCallsCodeObject"
                      - $ref: "#/components/schemas/RunStepDeltaStepDetailsToolCallsFileSearchObject"
                      - $ref: "#/components/schemas/RunStepDeltaStepDetailsToolCallsFunctionObject"
                  x-oaiExpandable: true
      required:
          - type
  """

  @type t :: %__MODULE__{
          type: String.t(),
          tool_calls: [
            OpenAi.Run.Step.Delta.Step.DetailsToolCallsCode.t()
            | OpenAi.Run.Step.Delta.Step.DetailsToolCallsFileSearch.t()
            | OpenAi.Run.Step.Delta.Step.DetailsToolCallsFunction.t()
          ]
        }

  defstruct [:tool_calls, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      tool_calls: [
        union: [
          {OpenAi.Run.Step.Delta.Step.DetailsToolCallsCode, :t},
          {OpenAi.Run.Step.Delta.Step.DetailsToolCallsFileSearch, :t},
          {OpenAi.Run.Step.Delta.Step.DetailsToolCallsFunction, :t}
        ]
      ],
      type: {:const, "tool_calls"}
    ]
  end
end
