defmodule OpenAi.Run.Step.Delta do
  @moduledoc """
  RunStepDeltaObject:
    type: object
    title: Run step delta object
    description: |
        Represents a run step delta i.e. any changed fields on a run step during streaming.
    properties:
        id:
            description: The identifier of the run step, which can be referenced in API endpoints.
            type: string
        object:
            description: The object type, which is always `thread.run.step.delta`.
            type: string
            enum: ["thread.run.step.delta"]
        delta:
            description: The delta containing the fields that have changed on the run step.
            type: object
            properties:
                step_details:
                    type: object
                    description: The details of the run step.
                    oneOf:
                        - $ref: "#/components/schemas/RunStepDeltaStepDetailsMessageCreationObject"
                        - $ref: "#/components/schemas/RunStepDeltaStepDetailsToolCallsObject"
                    x-oaiExpandable: true
    required:
        - id
        - object
        - delta
    x-oaiMeta:
        name: The run step delta object
        beta: true
        example: |
            {
              "id": "step_123",
              "object": "thread.run.step.delta",
              "delta": {
                "step_details": {
                  "type": "tool_calls",
                  "tool_calls": [
                    {
                      "index": 0,
                      "id": "call_123",
                      "type": "code_interpreter",
                      "code_interpreter": { "input": "", "outputs": [] }
                    }
                  ]
                }
              }
            }
  """

  @type t :: %__MODULE__{
          id: String.t(),
          object: String.t(),
          delta: OpenAi.Run.Step.Delta.Delta.t()
        }

  defstruct [:id, :object, :delta]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      object: {:const, "thread.run.step.delta"},
      delta: {OpenAi.Run.Step.Delta.Delta, :t}
    ]
  end
end
