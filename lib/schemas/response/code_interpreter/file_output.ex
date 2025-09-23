defmodule OpenAi.Response.CodeInterpreter.FileOutput do
  @moduledoc """
  Provides struct and type for a Response.CodeInterpreter.FileOutput
  """

  @type t :: %__MODULE__{
          files: [OpenAi.Response.CodeInterpreter.FileOutputFile.t()],
          type: String.t()
        }

  defstruct [:files, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [files: [{OpenAi.Response.CodeInterpreter.FileOutputFile, :t}], type: {:const, "files"}]
  end
end
