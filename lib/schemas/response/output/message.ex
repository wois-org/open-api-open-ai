defmodule OpenAi.Response.Output.Message do
  @moduledoc """
  Provides struct and type for a Response.Output.Message
  """

  @type t :: %__MODULE__{
          content: [OpenAi.Response.Output.TextContent.t() | OpenAi.Response.Refusal.Content.t()],
          id: String.t(),
          role: String.t(),
          status: String.t(),
          type: String.t()
        }

  defstruct [:content, :id, :role, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: [
        union: [{OpenAi.Response.Output.TextContent, :t}, {OpenAi.Response.Refusal.Content, :t}]
      ],
      id: {:string, :generic},
      role: {:const, "assistant"},
      status: {:enum, ["in_progress", "completed", "incomplete"]},
      type: {:const, "message"}
    ]
  end
end
