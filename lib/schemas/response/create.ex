defmodule OpenAi.Response.Create do
  @moduledoc """
  Provides struct and type for a Response.Create
  """

  @type t :: %__MODULE__{
          include: [String.t()] | nil,
          input:
            String.t()
            | [
                map
                | OpenAi.Response.Computer.ToolCall.t()
                | OpenAi.Response.FileSearch.Tool.Call.t()
                | OpenAi.Response.Function.ToolCall.t()
                | OpenAi.Response.Input.MessageEasy.t()
                | OpenAi.Response.Output.Message.t()
                | OpenAi.Response.Reasoning.Item.t()
                | OpenAi.Response.WebSearch.ToolCall.t()
              ]
            | nil,
          instructions: String.t() | nil,
          max_output_tokens: integer | nil,
          metadata: map | nil,
          model: String.t() | nil,
          parallel_tool_calls: boolean | nil,
          previous_response_id: String.t() | nil,
          reasoning: OpenAi.Response.Reasoning.t() | nil,
          service_tier: String.t() | nil,
          store: boolean | nil,
          stream: boolean | nil,
          temperature: number | nil,
          text: map | nil,
          tool_choice:
            OpenAi.Tool.Choice.Function.t() | OpenAi.Tool.Choice.Types.t() | String.t() | nil,
          tools:
            [
              OpenAi.Response.Computer.UsePreviewTool.t()
              | OpenAi.Response.FileSearch.Tool.t()
              | OpenAi.Response.Function.Tool.t()
              | OpenAi.Response.WebSearch.PreviewTool.t()
            ]
            | nil,
          top_p: number | nil,
          truncation: String.t() | nil,
          user: String.t() | nil
        }

  defstruct [
    :include,
    :input,
    :instructions,
    :max_output_tokens,
    :metadata,
    :model,
    :parallel_tool_calls,
    :previous_response_id,
    :reasoning,
    :service_tier,
    :store,
    :stream,
    :temperature,
    :text,
    :tool_choice,
    :tools,
    :top_p,
    :truncation,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      include: [
        enum: [
          "file_search_call.results",
          "message.input_image.image_url",
          "computer_call_output.output.image_url"
        ]
      ],
      input:
        {:union,
         [
           {:string, :generic},
           [
             union: [
               :map,
               {OpenAi.Response.Computer.ToolCall, :t},
               {OpenAi.Response.FileSearch.Tool.Call, :t},
               {OpenAi.Response.Function.ToolCall, :t},
               {OpenAi.Response.Input.MessageEasy, :t},
               {OpenAi.Response.Output.Message, :t},
               {OpenAi.Response.Reasoning.Item, :t},
               {OpenAi.Response.WebSearch.ToolCall, :t}
             ]
           ]
         ]},
      instructions: {:string, :generic},
      max_output_tokens: :integer,
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
           "o4-mini",
           "o4-mini-2025-04-16",
           "o3",
           "o3-2025-04-16",
           "o3-mini",
           "o3-mini-2025-01-31",
           "o1",
           "o1-2024-12-17",
           "o1-preview",
           "o1-preview-2024-09-12",
           "o1-mini",
           "o1-mini-2024-09-12",
           "gpt-4o",
           "gpt-4o-2024-11-20",
           "gpt-4o-2024-08-06",
           "gpt-4o-2024-05-13",
           "gpt-4o-audio-preview",
           "gpt-4o-audio-preview-2024-10-01",
           "gpt-4o-audio-preview-2024-12-17",
           "gpt-4o-mini-audio-preview",
           "gpt-4o-mini-audio-preview-2024-12-17",
           "gpt-4o-search-preview",
           "gpt-4o-mini-search-preview",
           "gpt-4o-search-preview-2025-03-11",
           "gpt-4o-mini-search-preview-2025-03-11",
           "chatgpt-4o-latest",
           "gpt-4o-mini",
           "gpt-4o-mini-2024-07-18",
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
           "gpt-3.5-turbo-0301",
           "gpt-3.5-turbo-0613",
           "gpt-3.5-turbo-1106",
           "gpt-3.5-turbo-0125",
           "gpt-3.5-turbo-16k-0613"
         ],
         enum: [
           "o1-pro",
           "o1-pro-2025-03-19",
           "computer-use-preview",
           "computer-use-preview-2025-03-11"
         ],
         string: :generic},
      parallel_tool_calls: :boolean,
      previous_response_id: {:string, :generic},
      reasoning: {OpenAi.Response.Reasoning, :t},
      service_tier: {:enum, ["auto", "default", "flex"]},
      store: :boolean,
      stream: :boolean,
      temperature: :number,
      text: :map,
      tool_choice:
        {:union,
         [
           {OpenAi.Tool.Choice.Function, :t},
           {OpenAi.Tool.Choice.Types, :t},
           enum: ["none", "auto", "required"]
         ]},
      tools: [
        union: [
          {OpenAi.Response.Computer.UsePreviewTool, :t},
          {OpenAi.Response.FileSearch.Tool, :t},
          {OpenAi.Response.Function.Tool, :t},
          {OpenAi.Response.WebSearch.PreviewTool, :t}
        ]
      ],
      top_p: :number,
      truncation: {:enum, ["auto", "disabled"]},
      user: {:string, :generic}
    ]
  end
end
