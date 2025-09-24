defmodule OpenAi.Thread.CreateAndRunRequest do
  @moduledoc """
  Provides struct and type for a Thread.CreateAndRunRequest
  """

  @type t :: %__MODULE__{
          assistant_id: String.t(),
          instructions: String.t() | nil,
          max_completion_tokens: integer | nil,
          max_prompt_tokens: integer | nil,
          metadata: map | nil,
          model: String.t() | nil,
          parallel_tool_calls: boolean | nil,
          response_format:
            OpenAi.Response.Format.Json.t()
            | OpenAi.Response.Format.JsonSchema.t()
            | OpenAi.Response.Format.Text.t()
            | String.t()
            | nil,
          stream: boolean | nil,
          temperature: number | nil,
          thread: OpenAi.Thread.CreateRequest.t() | nil,
          tool_choice: OpenAi.Assistant.NamedToolChoice.t() | String.t() | nil,
          tool_resources: OpenAi.Thread.CreateAndRunRequest.ToolResources.t() | nil,
          tools:
            [
              OpenAi.Assistant.Tool.Code.t()
              | OpenAi.Assistant.Tool.FileSearch.t()
              | OpenAi.Assistant.Tool.Function.t()
            ]
            | nil,
          top_p: number | nil,
          truncation_strategy: OpenAi.Truncation.t() | nil
        }

  defstruct [
    :assistant_id,
    :instructions,
    :max_completion_tokens,
    :max_prompt_tokens,
    :metadata,
    :model,
    :parallel_tool_calls,
    :response_format,
    :stream,
    :temperature,
    :thread,
    :tool_choice,
    :tool_resources,
    :tools,
    :top_p,
    :truncation_strategy
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assistant_id: {:string, :generic},
      instructions: {:string, :generic},
      max_completion_tokens: :integer,
      max_prompt_tokens: :integer,
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
      parallel_tool_calls: :boolean,
      response_format:
        {:union,
         [
           {OpenAi.Response.Format.Json, :t},
           {OpenAi.Response.Format.JsonSchema, :t},
           {OpenAi.Response.Format.Text, :t},
           const: "auto"
         ]},
      stream: :boolean,
      temperature: :number,
      thread: {OpenAi.Thread.CreateRequest, :t},
      tool_choice:
        {:union, [{OpenAi.Assistant.NamedToolChoice, :t}, enum: ["none", "auto", "required"]]},
      tool_resources: {OpenAi.Thread.CreateAndRunRequest.ToolResources, :t},
      tools: [
        union: [
          {OpenAi.Assistant.Tool.Code, :t},
          {OpenAi.Assistant.Tool.FileSearch, :t},
          {OpenAi.Assistant.Tool.Function, :t}
        ]
      ],
      top_p: :number,
      truncation_strategy: {OpenAi.Truncation, :t}
    ]
  end
end
