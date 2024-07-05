defmodule OpenAi.Chat.Completion.CreateRequest do
  @moduledoc """
  Provides struct and type for a Chat.Completion.CreateRequest
  """

  @type t :: %__MODULE__{
          frequency_penalty: number | nil,
          function_call: OpenAi.Chat.Completion.FunctionCallOption.t() | String.t() | nil,
          functions: [OpenAi.Chat.Completion.Function.t()] | nil,
          logit_bias: OpenAi.Chat.Completion.CreateRequest.LogitBias.t() | nil,
          logprobs: boolean | nil,
          max_tokens: integer | nil,
          messages: [
            OpenAi.Chat.Completion.Request.AssistantMessage.t()
            | OpenAi.Chat.Completion.Request.FunctionMessage.t()
            | OpenAi.Chat.Completion.Request.SystemMessage.t()
            | OpenAi.Chat.Completion.Request.ToolMessage.t()
            | OpenAi.Chat.Completion.Request.UserMessage.t()
          ],
          model: String.t(),
          n: integer | nil,
          parallel_tool_calls: boolean | nil,
          presence_penalty: number | nil,
          response_format: OpenAi.Chat.Completion.Request.CreateResponseFormat.t() | nil,
          seed: integer | nil,
          service_tier: String.t() | nil,
          stop: String.t() | [String.t()] | nil,
          stream: boolean | nil,
          stream_options: OpenAi.Chat.Completion.StreamOptions.t() | nil,
          temperature: number | nil,
          tool_choice: OpenAi.Chat.Completion.NamedTool.Choice.t() | String.t() | nil,
          tools: [OpenAi.Chat.Completion.Tool.t()] | nil,
          top_logprobs: integer | nil,
          top_p: number | nil,
          user: String.t() | nil
        }

  defstruct [
    :frequency_penalty,
    :function_call,
    :functions,
    :logit_bias,
    :logprobs,
    :max_tokens,
    :messages,
    :model,
    :n,
    :parallel_tool_calls,
    :presence_penalty,
    :response_format,
    :seed,
    :service_tier,
    :stop,
    :stream,
    :stream_options,
    :temperature,
    :tool_choice,
    :tools,
    :top_logprobs,
    :top_p,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      frequency_penalty: :number,
      function_call:
        {:union, [{OpenAi.Chat.Completion.FunctionCallOption, :t}, enum: ["none", "auto"]]},
      functions: [{OpenAi.Chat.Completion.Function, :t}],
      logit_bias: {OpenAi.Chat.Completion.CreateRequest.LogitBias, :t},
      logprobs: :boolean,
      max_tokens: :integer,
      messages: [
        union: [
          {OpenAi.Chat.Completion.Request.AssistantMessage, :t},
          {OpenAi.Chat.Completion.Request.FunctionMessage, :t},
          {OpenAi.Chat.Completion.Request.SystemMessage, :t},
          {OpenAi.Chat.Completion.Request.ToolMessage, :t},
          {OpenAi.Chat.Completion.Request.UserMessage, :t}
        ]
      ],
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
           "gpt-3.5-turbo-0301",
           "gpt-3.5-turbo-0613",
           "gpt-3.5-turbo-1106",
           "gpt-3.5-turbo-0125",
           "gpt-3.5-turbo-16k-0613"
         ],
         string: :generic},
      n: :integer,
      parallel_tool_calls: :boolean,
      presence_penalty: :number,
      response_format: {OpenAi.Chat.Completion.Request.CreateResponseFormat, :t},
      seed: :integer,
      service_tier: {:enum, ["auto", "default"]},
      stop: {:union, [{:string, :generic}, [string: :generic]]},
      stream: :boolean,
      stream_options: {OpenAi.Chat.Completion.StreamOptions, :t},
      temperature: :number,
      tool_choice:
        {:union,
         [{OpenAi.Chat.Completion.NamedTool.Choice, :t}, enum: ["none", "auto", "required"]]},
      tools: [{OpenAi.Chat.Completion.Tool, :t}],
      top_logprobs: :integer,
      top_p: :number,
      user: {:string, :generic}
    ]
  end
end
