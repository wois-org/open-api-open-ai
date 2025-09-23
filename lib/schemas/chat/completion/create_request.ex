defmodule OpenAi.Chat.Completion.CreateRequest do
  @moduledoc """
  Provides struct and type for a Chat.Completion.CreateRequest
  """

  @type t :: %__MODULE__{
          audio: OpenAi.Chat.Completion.CreateRequest.Audio.t() | nil,
          frequency_penalty: number | nil,
          function_call: OpenAi.Chat.Completion.FunctionCallOption.t() | String.t() | nil,
          functions: [OpenAi.Chat.Completion.Function.t()] | nil,
          logit_bias: OpenAi.Chat.Completion.CreateRequest.LogitBias.t() | nil,
          logprobs: boolean | nil,
          max_completion_tokens: integer | nil,
          max_tokens: integer | nil,
          messages:
            [
              OpenAi.Chat.Completion.Request.AssistantMessage.t()
              | OpenAi.Chat.Completion.Request.DeveloperMessage.t()
              | OpenAi.Chat.Completion.Request.FunctionMessage.t()
              | OpenAi.Chat.Completion.Request.SystemMessage.t()
              | OpenAi.Chat.Completion.Request.ToolMessage.t()
              | OpenAi.Chat.Completion.Request.UserMessage.t()
            ]
            | nil,
          metadata: map | nil,
          modalities: [String.t()] | nil,
          model: String.t() | nil,
          n: integer | nil,
          parallel_tool_calls: boolean | nil,
          prediction: OpenAi.Chat.Completion.PredictionContent.t() | nil,
          presence_penalty: number | nil,
          reasoning_effort: String.t() | nil,
          response_format:
            OpenAi.Response.Format.Json.t()
            | OpenAi.Response.Format.JsonSchema.t()
            | OpenAi.Response.Format.Text.t()
            | nil,
          seed: integer | nil,
          service_tier: String.t() | nil,
          stop: String.t() | [String.t()] | nil,
          store: boolean | nil,
          stream: boolean | nil,
          stream_options: OpenAi.Chat.Completion.Stream.Options.t() | nil,
          temperature: number | nil,
          tool_choice: OpenAi.Chat.Completion.NamedTool.Choice.t() | String.t() | nil,
          tools: [OpenAi.Chat.Completion.Tool.t()] | nil,
          top_logprobs: integer | nil,
          top_p: number | nil,
          user: String.t() | nil,
          web_search_options: OpenAi.Response.WebSearch.t() | nil
        }

  defstruct [
    :audio,
    :frequency_penalty,
    :function_call,
    :functions,
    :logit_bias,
    :logprobs,
    :max_completion_tokens,
    :max_tokens,
    :messages,
    :metadata,
    :modalities,
    :model,
    :n,
    :parallel_tool_calls,
    :prediction,
    :presence_penalty,
    :reasoning_effort,
    :response_format,
    :seed,
    :service_tier,
    :stop,
    :store,
    :stream,
    :stream_options,
    :temperature,
    :tool_choice,
    :tools,
    :top_logprobs,
    :top_p,
    :user,
    :web_search_options
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      audio: {OpenAi.Chat.Completion.CreateRequest.Audio, :t},
      frequency_penalty: :number,
      function_call:
        {:union, [{OpenAi.Chat.Completion.FunctionCallOption, :t}, enum: ["none", "auto"]]},
      functions: [{OpenAi.Chat.Completion.Function, :t}],
      logit_bias: {OpenAi.Chat.Completion.CreateRequest.LogitBias, :t},
      logprobs: :boolean,
      max_completion_tokens: :integer,
      max_tokens: :integer,
      messages: [
        union: [
          {OpenAi.Chat.Completion.Request.AssistantMessage, :t},
          {OpenAi.Chat.Completion.Request.DeveloperMessage, :t},
          {OpenAi.Chat.Completion.Request.FunctionMessage, :t},
          {OpenAi.Chat.Completion.Request.SystemMessage, :t},
          {OpenAi.Chat.Completion.Request.ToolMessage, :t},
          {OpenAi.Chat.Completion.Request.UserMessage, :t}
        ]
      ],
      metadata: :map,
      modalities: [enum: ["text", "audio"]],
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
         string: :generic},
      n: :integer,
      parallel_tool_calls: :boolean,
      prediction: {OpenAi.Chat.Completion.PredictionContent, :t},
      presence_penalty: :number,
      reasoning_effort: {:enum, ["low", "medium", "high"]},
      response_format:
        {:union,
         [
           {OpenAi.Response.Format.Json, :t},
           {OpenAi.Response.Format.JsonSchema, :t},
           {OpenAi.Response.Format.Text, :t}
         ]},
      seed: :integer,
      service_tier: {:enum, ["auto", "default", "flex"]},
      stop: {:union, [{:string, :generic}, [string: :generic]]},
      store: :boolean,
      stream: :boolean,
      stream_options: {OpenAi.Chat.Completion.Stream.Options, :t},
      temperature: :number,
      tool_choice:
        {:union,
         [{OpenAi.Chat.Completion.NamedTool.Choice, :t}, enum: ["none", "auto", "required"]]},
      tools: [{OpenAi.Chat.Completion.Tool, :t}],
      top_logprobs: :integer,
      top_p: :number,
      user: {:string, :generic},
      web_search_options: {OpenAi.Response.WebSearch, :t}
    ]
  end
end
