defmodule OpenAi.Run.Step.DetailsToolCallsFunction do
  @moduledoc """
  Provides struct and type for a Run.Step.DetailsToolCallsFunction
  """

  @type t :: %__MODULE__{
          function: OpenAi.Run.Step.DetailsToolCallsFunctionFunction.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:function, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      function: {OpenAi.Run.Step.DetailsToolCallsFunctionFunction, :t},
      id: {:string, :generic},
      type: {:const, "function"}
    ]
  end
end
