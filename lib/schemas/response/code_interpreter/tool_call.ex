defmodule OpenAi.Response.CodeInterpreter.ToolCall do
  @moduledoc """
  Provides struct and type for a Response.CodeInterpreter.ToolCall
  """

  @type t :: %__MODULE__{
          code: String.t(),
          id: String.t(),
          results: [
            OpenAi.Response.CodeInterpreter.FileOutput.t()
            | OpenAi.Response.CodeInterpreter.TextOutput.t()
          ],
          status: String.t(),
          type: String.t()
        }

  defstruct [:code, :id, :results, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: {:string, :generic},
      id: {:string, :generic},
      results: [
        union: [
          {OpenAi.Response.CodeInterpreter.FileOutput, :t},
          {OpenAi.Response.CodeInterpreter.TextOutput, :t}
        ]
      ],
      status: {:enum, ["in_progress", "interpreting", "completed"]},
      type: {:const, "code_interpreter_call"}
    ]
  end
end
