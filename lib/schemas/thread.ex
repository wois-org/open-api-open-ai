defmodule OpenAi.Thread do
  @moduledoc """
  Provides struct and type for a Thread
  """

  @type t :: %__MODULE__{
          created_at: integer,
          id: String.t(),
          metadata: map | nil,
          object: String.t(),
          tool_resources: OpenAi.Thread.ToolResources.t() | nil
        }

  defstruct [:created_at, :id, :metadata, :object, :tool_resources]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      id: {:string, :generic},
      metadata: :map,
      object: {:const, "thread"},
      tool_resources: {OpenAi.Thread.ToolResources, :t}
    ]
  end
end
