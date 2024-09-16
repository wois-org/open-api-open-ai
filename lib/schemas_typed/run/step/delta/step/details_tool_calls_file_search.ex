defmodule OpenAi.Run.Step.Delta.Step.DetailsToolCallsFileSearch do
  @moduledoc """
  Provides struct and type for a Run.Step.Delta.Step.DetailsToolCallsFileSearch

  RunStepDeltaStepDetailsToolCallsFileSearchObject:
    title: File search tool call
    type: object
    properties:
        index:
            type: integer
            description: The index of the tool call in the tool calls array.
        id:
            type: string
            description: The ID of the tool call object.
        type:
            type: string
            description: The type of tool call. This is always going to be `file_search` for this type of tool call.
            enum: ["file_search"]
        file_search:
            type: object
            description: For now, this is always going to be an empty object.
            x-oaiTypeLabel: map
    required:
        - index
        - type
        - file_search
  """

  @type t :: %__MODULE__{
          file_search: map(),
          id: String.t(),
          index: integer(),
          type: String.t()
        }

  defstruct [:file_search, :id, :index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      file_search: :map,
      id: {:string, :generic},
      index: :integer,
      type: {:const, "file_search"}
    ]
  end
end
