defmodule OpenAi.Run.Step.Delta.Delta do
  @moduledoc """
  Provides struct and type for a Run.Step.Delta.Delta
  """
  @type t :: %__MODULE__{
          step_details:
            OpenAi.Run.Step.Delta.Step.DetailsMessageCreation.t()
            | OpenAi.Run.Step.Delta.Step.DetailsToolCalls.t()
        }

  defstruct [:step_details]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      step_details:
        {:union,
         [
           {OpenAi.Run.Step.Delta.Step.DetailsMessageCreation, :t},
           {OpenAi.Run.Step.Delta.Step.DetailsToolCalls, :t}
         ]}
    ]
  end
end
