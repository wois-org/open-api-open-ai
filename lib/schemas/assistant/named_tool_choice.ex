defmodule OpenAi.Assistant.NamedToolChoice do
  @moduledoc """
  Provides struct and type for a Assistant.NamedToolChoice
  """

  @type t :: %__MODULE__{
          function: OpenAi.Assistant.NamedToolChoiceFunction.t() | nil,
          type: String.t()
        }

  defstruct [:function, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      function: {OpenAi.Assistant.NamedToolChoiceFunction, :t},
      type: {:enum, ["function", "code_interpreter", "file_search"]}
    ]
  end
end
