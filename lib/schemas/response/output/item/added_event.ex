defmodule OpenAi.Response.Output.Item.AddedEvent do
  @moduledoc """
  Provides struct and type for a Response.Output.Item.AddedEvent
  """

  @type t :: %__MODULE__{
          item:
            OpenAi.Response.Computer.ToolCall.t()
            | OpenAi.Response.FileSearch.Tool.Call.t()
            | OpenAi.Response.Function.ToolCall.t()
            | OpenAi.Response.Output.Message.t()
            | OpenAi.Response.Reasoning.Item.t()
            | OpenAi.Response.WebSearch.ToolCall.t(),
          output_index: integer,
          type: String.t()
        }

  defstruct [:item, :output_index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      item:
        {:union,
         [
           {OpenAi.Response.Computer.ToolCall, :t},
           {OpenAi.Response.FileSearch.Tool.Call, :t},
           {OpenAi.Response.Function.ToolCall, :t},
           {OpenAi.Response.Output.Message, :t},
           {OpenAi.Response.Reasoning.Item, :t},
           {OpenAi.Response.WebSearch.ToolCall, :t}
         ]},
      output_index: :integer,
      type: {:const, "response.output_item.added"}
    ]
  end
end
