defmodule OpenAi.Run.Step.DetailsToolCallsCodeCodeInterpreter do
  @moduledoc """
  Provides struct and type for a Run.Step.DetailsToolCallsCodeCodeInterpreter
  """

  @type t :: %__MODULE__{
          input: String.t(),
          outputs: [
            OpenAi.Run.Step.DetailsToolCallsCodeOutputImage.t()
            | OpenAi.Run.Step.DetailsToolCallsCodeOutputLogs.t()
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
          {OpenAi.Run.Step.DetailsToolCallsCodeOutputImage, :t},
          {OpenAi.Run.Step.DetailsToolCallsCodeOutputLogs, :t}
        ]
      ]
    ]
  end
end
