defmodule OpenAi.Run.Step.Delta.Step.DetailsToolCallsFunction do
  @moduledoc """
  Provides struct and type for a Run.Step.Delta.Step.DetailsToolCallsFunction

  RunStepDeltaStepDetailsToolCallsFunctionObject:
    type: object
    title: Function tool call
    properties:
        index:
            type: integer
            description: The index of the tool call in the tool calls array.
        id:
            type: string
            description: The ID of the tool call object.
        type:
            type: string
            description: The type of tool call. This is always going to be `function` for this type of tool call.
            enum: ["function"]
        function:
            type: object
            description: The definition of the function that was called.
            properties:
                name:
                    type: string
                    description: The name of the function.
                arguments:
                    type: string
                    description: The arguments passed to the function.
                output:
                    type: string
                    description: The output of the function. This will be `null` if the outputs have not been [submitted](https://platform.openai.com/docs/api-reference/runs/submitToolOutputs) yet.
                    nullable: true
    required:
        - index
        - type
  """

  @type t :: %__MODULE__{
          function: map(),
          id: String.t(),
          index: integer(),
          type: String.t()
        }

  defstruct [:function, :id, :index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      function: :map,
      id: {:string, :generic},
      index: :integer,
      type: {:const, "function"}
    ]
  end
end
