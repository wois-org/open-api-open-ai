defmodule OpenAi.Run.Step.Delta.Step.DetailsToolCallsCodeCodeInterpreter do
  @moduledoc """
  Provides struct and type for a Run.Step.Delta.Step.DetailsToolCallsCodeCodeInterpreter

  oneOf:
    - $ref: "#/components/schemas/RunStepDeltaStepDetailsToolCallsCodeOutputLogsObject"
    - $ref: "#/components/schemas/RunStepDeltaStepDetailsToolCallsCodeOutputImageObject"
  """

  @type t :: %__MODULE__{
          input: String.t(),
          outputs: [
            OpenAi.Run.Step.Delta.Step.DetailsToolCallsCodeOutputImage.t()
            | OpenAi.Run.Step.Delta.Step.DetailsToolCallsCodeOutputLogs.t()
          ]
        }

  defstruct [:input, :outputs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input: {:string, :generic},
      outputs: [
        union: [
          {OpenAi.Run.Step.Delta.Step.DetailsToolCallsCodeOutputImage, :t},
          {OpenAi.Run.Step.Delta.Step.DetailsToolCallsCodeOutputLogs, :t}
        ]
      ]
    ]
  end
end
