defmodule OpenAi.Thread.CreateRequest do
  @moduledoc """
  Provides struct and type for a Thread.CreateRequest
  """

  @type t :: %__MODULE__{
          messages: [OpenAi.Message.CreateRequest.t()] | nil,
          metadata: map | nil,
          tool_resources: OpenAi.Thread.CreateRequest.ToolResources.t() | nil
        }

  defstruct [:messages, :metadata, :tool_resources]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      messages: [{OpenAi.Message.CreateRequest, :t}],
      metadata: :map,
      tool_resources: {OpenAi.Thread.CreateRequest.ToolResources, :t}
    ]
  end
end
