defmodule OpenAi.Response.Input.MessageResource do
  @moduledoc """
  Provides struct and type for a Response.Input.MessageResource
  """

  @type t :: %__MODULE__{
          content:
            [
              OpenAi.Response.Input.FileContent.t()
              | OpenAi.Response.Input.ImageContent.t()
              | OpenAi.Response.Input.TextContent.t()
            ]
            | nil,
          id: String.t() | nil,
          role: String.t() | nil,
          status: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:content, :id, :role, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: [
        union: [
          {OpenAi.Response.Input.FileContent, :t},
          {OpenAi.Response.Input.ImageContent, :t},
          {OpenAi.Response.Input.TextContent, :t}
        ]
      ],
      id: {:string, :generic},
      role: {:enum, ["user", "system", "developer"]},
      status: {:enum, ["in_progress", "completed", "incomplete"]},
      type: {:const, "message"}
    ]
  end
end
