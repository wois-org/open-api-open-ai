defmodule OpenAi.Assistant.UpdateRequest do
  @moduledoc """
  Provides struct and type for a Assistant.UpdateRequest
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          instructions: String.t() | nil,
          metadata: map | nil,
          model: String.t() | nil,
          name: String.t() | nil,
          reasoning_effort: String.t() | nil,
          response_format:
            OpenAi.Response.Format.Json.t()
            | OpenAi.Response.Format.JsonSchema.t()
            | OpenAi.Response.Format.Text.t()
            | String.t()
            | nil,
          temperature: number | nil,
          tool_resources: OpenAi.Assistant.UpdateRequest.ToolResources.t() | nil,
          tools:
            [
              OpenAi.Assistant.Tool.Code.t()
              | OpenAi.Assistant.Tool.FileSearch.t()
              | OpenAi.Assistant.Tool.Function.t()
            ]
            | nil,
          top_p: number | nil
        }

  defstruct [
    :description,
    :instructions,
    :metadata,
    :model,
    :name,
    :reasoning_effort,
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
      description: {:string, :generic},
      instructions: {:string, :generic},
      metadata: :map,
      model:
        {:union,
         enum: [
           "gpt-4.1",
           "gpt-4.1-mini",
           "gpt-4.1-nano",
           "gpt-4.1-2025-04-14",
           "gpt-4.1-mini-2025-04-14",
           "gpt-4.1-nano-2025-04-14",
           "o3-mini",
           "o3-mini-2025-01-31",
           "o1",
           "o1-2024-12-17",
           "gpt-4o",
           "gpt-4o-2024-11-20",
           "gpt-4o-2024-08-06",
           "gpt-4o-2024-05-13",
           "gpt-4o-mini",
           "gpt-4o-mini-2024-07-18",
           "gpt-4.5-preview",
           "gpt-4.5-preview-2025-02-27",
           "gpt-4-turbo",
           "gpt-4-turbo-2024-04-09",
           "gpt-4-0125-preview",
           "gpt-4-turbo-preview",
           "gpt-4-1106-preview",
           "gpt-4-vision-preview",
           "gpt-4",
           "gpt-4-0314",
           "gpt-4-0613",
           "gpt-4-32k",
           "gpt-4-32k-0314",
           "gpt-4-32k-0613",
           "gpt-3.5-turbo",
           "gpt-3.5-turbo-16k",
           "gpt-3.5-turbo-0613",
           "gpt-3.5-turbo-1106",
           "gpt-3.5-turbo-0125",
           "gpt-3.5-turbo-16k-0613"
         ],
         string: :generic},
      name: {:string, :generic},
      reasoning_effort: {:enum, ["low", "medium", "high"]},
      response_format:
        {:union,
         [
           {OpenAi.Response.Format.Json, :t},
           {OpenAi.Response.Format.JsonSchema, :t},
           {OpenAi.Response.Format.Text, :t},
           const: "auto"
         ]},
      temperature: :number,
      tool_resources: {OpenAi.Assistant.UpdateRequest.ToolResources, :t},
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
