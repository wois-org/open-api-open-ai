defmodule OpenAi.Response.CodeInterpreter.Call.Code.DoneEvent do
  @moduledoc """
  Provides struct and type for a Response.CodeInterpreter.Call.Code.DoneEvent
  """

  @type t :: %__MODULE__{code: String.t(), output_index: integer, type: String.t()}

  defstruct [:code, :output_index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: {:string, :generic},
      output_index: :integer,
      type: {:const, "response.code_interpreter_call.code.done"}
    ]
  end
end
