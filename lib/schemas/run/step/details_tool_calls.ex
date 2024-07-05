defmodule OpenAi.Run.Step.DetailsToolCalls do
  @moduledoc """
  Provides struct and type for a Run.Step.DetailsToolCalls
  """

  @type t :: %__MODULE__{
          tool_calls: [
            OpenAi.Run.Step.DetailsToolCallsCode.t()
            | OpenAi.Run.Step.DetailsToolCallsFileSearch.t()
            | OpenAi.Run.Step.DetailsToolCallsFunction.t()
          ],
          type: String.t()
        }

  defstruct [:tool_calls, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      tool_calls: [
        union: [
          {OpenAi.Run.Step.DetailsToolCallsCode, :t},
          {OpenAi.Run.Step.DetailsToolCallsFileSearch, :t},
          {OpenAi.Run.Step.DetailsToolCallsFunction, :t}
        ]
      ],
      type: {:const, "tool_calls"}
    ]
  end
end
