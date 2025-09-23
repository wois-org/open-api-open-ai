defmodule OpenAi.Response.ContentPart.AddedEvent do
  @moduledoc """
  Provides struct and type for a Response.ContentPart.AddedEvent
  """

  @type t :: %__MODULE__{
          content_index: integer,
          item_id: String.t(),
          output_index: integer,
          part: OpenAi.Response.Output.TextContent.t() | OpenAi.Response.Refusal.Content.t(),
          type: String.t()
        }

  defstruct [:content_index, :item_id, :output_index, :part, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content_index: :integer,
      item_id: {:string, :generic},
      output_index: :integer,
      part:
        {:union,
         [{OpenAi.Response.Output.TextContent, :t}, {OpenAi.Response.Refusal.Content, :t}]},
      type: {:const, "response.content_part.added"}
    ]
  end
end
