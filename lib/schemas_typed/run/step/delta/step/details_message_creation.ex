defmodule OpenAi.Run.Step.Delta.Step.DetailsMessageCreation do
  @moduledoc """
  Provides struct and type for a Run.Step.Delta.Step.DetailsMessageCreation

  RunStepDeltaStepDetailsMessageCreationObject:
    title: Message creation
    type: object
    description: Details of the message creation by the run step.
    properties:
        type:
            description: Always `message_creation`.
            type: string
            enum: ["message_creation"]
        message_creation:
            type: object
            properties:
                message_id:
                    type: string
                    description: The ID of the message that was created by this run step.
    required:
        - type
  """

  @type t :: %__MODULE__{
          message_creation: OpenAi.Run.Step.Delta.Step.DetailsMessageCreationMessageCreation.t(),
          type: String.t()
        }

  defstruct [:message_creation, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      message_creation: {OpenAi.Run.Step.Delta.Step.DetailsMessageCreationMessageCreation, :t},
      type: {:const, "message_creation"}
    ]
  end
end
