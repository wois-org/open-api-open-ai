defmodule OpenAi.Run do
  @moduledoc """
  Provides struct and type for a Run
  """

  @type t :: %__MODULE__{
          assistant_id: String.t(),
          cancelled_at: integer | nil,
          completed_at: integer | nil,
          created_at: integer,
          expires_at: integer | nil,
          failed_at: integer | nil,
          id: String.t(),
          incomplete_details: OpenAi.Run.IncompleteDetails.t() | nil,
          instructions: String.t(),
          last_error: OpenAi.Run.LastError.t() | nil,
          max_completion_tokens: integer | nil,
          max_prompt_tokens: integer | nil,
          metadata: map,
          model: String.t(),
          object: String.t(),
          parallel_tool_calls: boolean,
          required_action: OpenAi.Run.RequiredAction.t() | nil,
          response_format:
            OpenAi.Response.Format.Json.t()
            | OpenAi.Response.Format.JsonSchema.t()
            | OpenAi.Response.Format.Text.t()
            | String.t(),
          started_at: integer | nil,
          status: String.t(),
          temperature: number | nil,
          thread_id: String.t(),
          tool_choice: OpenAi.Assistant.NamedToolChoice.t() | String.t(),
          tools: [
            OpenAi.Assistant.Tool.Code.t()
            | OpenAi.Assistant.Tool.FileSearch.t()
            | OpenAi.Assistant.Tool.Function.t()
          ],
          top_p: number | nil,
          truncation_strategy: OpenAi.Truncation.t(),
          usage: OpenAi.Run.CompletionUsage.t()
        }

  defstruct [
    :assistant_id,
    :cancelled_at,
    :completed_at,
    :created_at,
    :expires_at,
    :failed_at,
    :id,
    :incomplete_details,
    :instructions,
    :last_error,
    :max_completion_tokens,
    :max_prompt_tokens,
    :metadata,
    :model,
    :object,
    :parallel_tool_calls,
    :required_action,
    :response_format,
    :started_at,
    :status,
    :temperature,
    :thread_id,
    :tool_choice,
    :tools,
    :top_p,
    :truncation_strategy,
    :usage
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assistant_id: {:string, :generic},
      cancelled_at: :integer,
      completed_at: :integer,
      created_at: :integer,
      expires_at: :integer,
      failed_at: :integer,
      id: {:string, :generic},
      incomplete_details: {OpenAi.Run.IncompleteDetails, :t},
      instructions: {:string, :generic},
      last_error: {OpenAi.Run.LastError, :t},
      max_completion_tokens: :integer,
      max_prompt_tokens: :integer,
      metadata: :map,
      model: {:string, :generic},
      object: {:const, "thread.run"},
      parallel_tool_calls: :boolean,
      required_action: {OpenAi.Run.RequiredAction, :t},
      response_format:
        {:union,
         [
           {OpenAi.Response.Format.Json, :t},
           {OpenAi.Response.Format.JsonSchema, :t},
           {OpenAi.Response.Format.Text, :t},
           const: "auto"
         ]},
      started_at: :integer,
      status:
        {:enum,
         [
           "queued",
           "in_progress",
           "requires_action",
           "cancelling",
           "cancelled",
           "failed",
           "completed",
           "incomplete",
           "expired"
         ]},
      temperature: :number,
      thread_id: {:string, :generic},
      tool_choice:
        {:union, [{OpenAi.Assistant.NamedToolChoice, :t}, enum: ["none", "auto", "required"]]},
      tools: [
        union: [
          {OpenAi.Assistant.Tool.Code, :t},
          {OpenAi.Assistant.Tool.FileSearch, :t},
          {OpenAi.Assistant.Tool.Function, :t}
        ]
      ],
      top_p: :number,
      truncation_strategy: {OpenAi.Truncation, :t},
      usage: {OpenAi.Run.CompletionUsage, :t}
    ]
  end
end
