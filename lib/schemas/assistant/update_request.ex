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
          response_format: OpenAi.Assistant.ApiResponseFormat.t() | String.t() | nil,
          temperature: number | nil,
          tool_resources: OpenAi.Assistant.UpdateRequest.ToolResources.t() | nil,
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
      model: {:string, :generic},
      name: {:string, :generic},
      response_format:
        {:union, [{OpenAi.Assistant.ApiResponseFormat, :t}, enum: ["none", "auto"]]},
      temperature: :number,
      tool_resources: {OpenAi.Assistant.UpdateRequest.ToolResources, :t},
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
