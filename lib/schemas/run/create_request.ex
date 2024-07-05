defmodule OpenAi.Run.CreateRequest do
  @moduledoc """
  Provides struct and type for a Run.CreateRequest
  """

  @type t :: %__MODULE__{
          additional_instructions: String.t() | nil,
          additional_messages: [OpenAi.Message.CreateRequest.t()] | nil,
          assistant_id: String.t(),
          instructions: String.t() | nil,
          max_completion_tokens: integer | nil,
          max_prompt_tokens: integer | nil,
          metadata: map | nil,
          model: String.t() | nil,
          parallel_tool_calls: boolean | nil,
          response_format: OpenAi.Assistant.ApiResponseFormat.t() | String.t() | nil,
          stream: boolean | nil,
          temperature: number | nil,
          tool_choice: OpenAi.Assistant.NamedToolChoice.t() | String.t() | nil,
          tools:
            [
              OpenAi.Assistant.Tool.Code.t()
              | OpenAi.Assistant.Tool.File.Search.t()
              | OpenAi.Assistant.Tool.Function.t()
            ]
            | nil,
          top_p: number | nil,
          truncation_strategy: OpenAi.Truncation.t() | nil
        }

  defstruct [
    :additional_instructions,
    :additional_messages,
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
    :tool_choice,
    :tools,
    :top_p,
    :truncation_strategy
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      additional_instructions: {:string, :generic},
      additional_messages: [{OpenAi.Message.CreateRequest, :t}],
      assistant_id: {:string, :generic},
      instructions: {:string, :generic},
      max_completion_tokens: :integer,
      max_prompt_tokens: :integer,
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
      parallel_tool_calls: :boolean,
      response_format:
        {:union, [{OpenAi.Assistant.ApiResponseFormat, :t}, enum: ["none", "auto"]]},
      stream: :boolean,
      temperature: :number,
      tool_choice:
        {:union, [{OpenAi.Assistant.NamedToolChoice, :t}, enum: ["none", "auto", "required"]]},
      tools: [
        union: [
          {OpenAi.Assistant.Tool.Code, :t},
          {OpenAi.Assistant.Tool.File.Search, :t},
          {OpenAi.Assistant.Tool.Function, :t}
        ]
      ],
      top_p: :number,
      truncation_strategy: {OpenAi.Truncation, :t}
    ]
  end
end
