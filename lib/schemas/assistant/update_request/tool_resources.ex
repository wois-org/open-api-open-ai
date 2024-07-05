defmodule OpenAi.Assistant.UpdateRequest.ToolResources do
  @moduledoc """
  Provides struct and type for a Assistant.UpdateRequest.ToolResources
  """

  @type t :: %__MODULE__{
          code_interpreter:
            OpenAi.Assistant.UpdateRequest.ToolResources.CodeInterpreter.t() | nil,
          file_search: OpenAi.Assistant.UpdateRequest.ToolResources.FileSearch.t() | nil
        }

  defstruct [:code_interpreter, :file_search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {OpenAi.Assistant.UpdateRequest.ToolResources.CodeInterpreter, :t},
      file_search: {OpenAi.Assistant.UpdateRequest.ToolResources.FileSearch, :t}
    ]
  end
end
