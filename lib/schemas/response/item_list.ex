defmodule OpenAi.Response.ItemList do
  @moduledoc """
  Provides struct and type for a Response.ItemList
  """

  @type t :: %__MODULE__{
          data: [
            OpenAi.Response.Computer.ToolCall.t()
            | OpenAi.Response.Computer.ToolCall.OutputResource.t()
            | OpenAi.Response.FileSearch.Tool.Call.t()
            | OpenAi.Response.Function.ToolCall.OutputResource.t()
            | OpenAi.Response.Function.ToolCall.Resource.t()
            | OpenAi.Response.Input.MessageResource.t()
            | OpenAi.Response.Output.Message.t()
            | OpenAi.Response.WebSearch.ToolCall.t()
          ],
          first_id: String.t(),
          has_more: boolean,
          last_id: String.t(),
          object: String.t()
        }

  defstruct [:data, :first_id, :has_more, :last_id, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [
        union: [
          {OpenAi.Response.Computer.ToolCall, :t},
          {OpenAi.Response.Computer.ToolCall.OutputResource, :t},
          {OpenAi.Response.FileSearch.Tool.Call, :t},
          {OpenAi.Response.Function.ToolCall.OutputResource, :t},
          {OpenAi.Response.Function.ToolCall.Resource, :t},
          {OpenAi.Response.Input.MessageResource, :t},
          {OpenAi.Response.Output.Message, :t},
          {OpenAi.Response.WebSearch.ToolCall, :t}
        ]
      ],
      first_id: {:string, :generic},
      has_more: :boolean,
      last_id: {:string, :generic},
      object: {:const, "list"}
    ]
  end
end
