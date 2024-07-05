defmodule OpenAi.Thread.CreateAndRunRequest.ToolResources do
  @moduledoc """
  Provides struct and type for a Thread.CreateAndRunRequest.ToolResources
  """

  @type t :: %__MODULE__{
          code_interpreter:
            OpenAi.Thread.CreateAndRunRequest.ToolResourcesCodeInterpreter.t() | nil,
          file_search: OpenAi.Thread.CreateAndRunRequest.ToolResourcesFileSearch.t() | nil
        }

  defstruct [:code_interpreter, :file_search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {OpenAi.Thread.CreateAndRunRequest.ToolResourcesCodeInterpreter, :t},
      file_search: {OpenAi.Thread.CreateAndRunRequest.ToolResourcesFileSearch, :t}
    ]
  end
end
