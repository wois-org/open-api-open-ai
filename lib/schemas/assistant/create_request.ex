defmodule OpenAi.Assistant.CreateRequest do
  @moduledoc """
  Provides struct and type for a Assistant.CreateRequest
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          instructions: String.t() | nil,
          metadata: map | nil,
          model: String.t(),
          name: String.t() | nil,
          response_format: OpenAi.Assistant.ApiResponseFormat.t() | String.t() | nil,
          temperature: number | nil,
          tool_resources: OpenAi.Assistant.CreateRequest.ToolResources.t() | nil,
          tools:
            [
              OpenAi.Assistant.Tool.Code.t()
              | OpenAi.Assistant.Tool.File.Search.t()
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
           "gpt-4o",
           "gpt-4o-2024-05-13",
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
      response_format:
        {:union, [{OpenAi.Assistant.ApiResponseFormat, :t}, enum: ["none", "auto"]]},
      temperature: :number,
      tool_resources: {OpenAi.Assistant.CreateRequest.ToolResources, :t},
      tools: [
        union: [
          {OpenAi.Assistant.Tool.Code, :t},
          {OpenAi.Assistant.Tool.File.Search, :t},
          {OpenAi.Assistant.Tool.Function, :t}
        ]
      ],
      top_p: :number
    ]
  end
end
