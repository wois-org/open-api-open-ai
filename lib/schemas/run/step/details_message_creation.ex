defmodule OpenAi.Run.Step.DetailsMessageCreation do
  @moduledoc """
  Provides struct and type for a Run.Step.DetailsMessageCreation
  """

  @type t :: %__MODULE__{
          message_creation: OpenAi.Run.Step.DetailsMessageCreationMessageCreation.t(),
          type: String.t()
        }

  defstruct [:message_creation, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      message_creation: {OpenAi.Run.Step.DetailsMessageCreationMessageCreation, :t},
      type: {:const, "message_creation"}
    ]
  end
end
