defmodule OpenAi.Assistant do
  @moduledoc """
  Provides struct and type for a Assistant
  """

  @type t :: %__MODULE__{
          created_at: integer,
          description: String.t() | nil,
          id: String.t(),
          instructions: String.t() | nil,
          metadata: map,
          model: String.t(),
          name: String.t() | nil,
          object: String.t(),
          response_format:
            OpenAi.Response.Format.Json.t()
            | OpenAi.Response.Format.JsonSchema.t()
            | OpenAi.Response.Format.Text.t()
            | String.t()
            | nil,
          temperature: number | nil,
          tool_resources: OpenAi.Assistant.Tool.Resources.t() | nil,
          tools: [
            OpenAi.Assistant.Tool.Code.t()
            | OpenAi.Assistant.Tool.FileSearch.t()
            | OpenAi.Assistant.Tool.Function.t()
          ],
          top_p: number | nil
        }

  defstruct [
    :created_at,
    :description,
    :id,
    :instructions,
    :metadata,
    :model,
    :name,
    :object,
    :response_format,
    :temperature,
    :tool_resources,
    :tools,
    :top_p
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      description: {:string, :generic},
      id: {:string, :generic},
      instructions: {:string, :generic},
      metadata: :map,
      model: {:string, :generic},
      name: {:string, :generic},
      object: {:const, "assistant"},
      response_format:
        {:union,
         [
           {OpenAi.Response.Format.Json, :t},
           {OpenAi.Response.Format.JsonSchema, :t},
           {OpenAi.Response.Format.Text, :t},
           const: "auto"
         ]},
      temperature: :number,
      tool_resources: {OpenAi.Assistant.Tool.Resources, :t},
      tools: [
        union: [
          {OpenAi.Assistant.Tool.Code, :t},
          {OpenAi.Assistant.Tool.FileSearch, :t},
          {OpenAi.Assistant.Tool.Function, :t}
        ]
      ],
      top_p: :number
    ]
  end
end
