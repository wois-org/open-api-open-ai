defmodule OpenAi.Assistant.Tool.Resources do
  @moduledoc """
  Provides struct and type for a Assistant.Tool.Resources
  """

  @type t :: %__MODULE__{
          code_interpreter: OpenAi.Assistant.Tool.Resources.CodeInterpreter.t() | nil,
          file_search: OpenAi.Assistant.Tool.Resources.FileSearch.t() | nil
        }

  defstruct [:code_interpreter, :file_search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {OpenAi.Assistant.Tool.Resources.CodeInterpreter, :t},
      file_search: {OpenAi.Assistant.Tool.Resources.FileSearch, :t}
    ]
  end
end
