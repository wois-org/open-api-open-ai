defmodule OpenAi.Run.RequiredAction do
  @moduledoc """
  Provides struct and type for a Run.RequiredAction
  """

  @type t :: %__MODULE__{
          submit_tool_outputs: OpenAi.Run.RequiredAction.SubmitToolOutputs.t(),
          type: String.t()
        }

  defstruct [:submit_tool_outputs, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      submit_tool_outputs: {OpenAi.Run.RequiredAction.SubmitToolOutputs, :t},
      type: {:const, "submit_tool_outputs"}
    ]
  end
end
