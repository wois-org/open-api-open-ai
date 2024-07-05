defmodule OpenAi.Thread.UpdateRequest do
  @moduledoc """
  Provides struct and type for a Thread.UpdateRequest
  """

  @type t :: %__MODULE__{
          metadata: map | nil,
          tool_resources: OpenAi.Thread.UpdateRequest.ToolResources.t() | nil
        }

  defstruct [:metadata, :tool_resources]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [metadata: :map, tool_resources: {OpenAi.Thread.UpdateRequest.ToolResources, :t}]
  end
end
