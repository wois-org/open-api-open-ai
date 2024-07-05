defmodule OpenAi.Assistant.CreateRequest.ToolResources do
  @moduledoc """
  Provides struct and type for a Assistant.CreateRequest.ToolResources
  """

  @type t :: %__MODULE__{
          code_interpreter:
            OpenAi.Assistant.CreateRequest.ToolResources.CodeInterpreter.t() | nil,
          file_search: map | nil
        }

  defstruct [:code_interpreter, :file_search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {OpenAi.Assistant.CreateRequest.ToolResources.CodeInterpreter, :t},
      file_search: :map
    ]
  end
end
