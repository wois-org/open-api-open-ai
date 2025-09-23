defmodule OpenAi.Eval.Responses.Source do
  @moduledoc """
  Provides struct and type for a Eval.Responses.Source
  """

  @type t :: %__MODULE__{
          allow_parallel_tool_calls: boolean | nil,
          created_after: integer | nil,
          created_before: integer | nil,
          has_tool_calls: boolean | nil,
          instructions_search: String.t() | nil,
          metadata: map | nil,
          model: String.t() | nil,
          reasoning_effort: String.t() | nil,
          temperature: number | nil,
          top_p: number | nil,
          type: String.t(),
          users: [String.t()] | nil
        }

  defstruct [
    :allow_parallel_tool_calls,
    :created_after,
    :created_before,
    :has_tool_calls,
    :instructions_search,
    :metadata,
    :model,
    :reasoning_effort,
    :temperature,
    :top_p,
    :type,
    :users
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_parallel_tool_calls: :boolean,
      created_after: :integer,
      created_before: :integer,
      has_tool_calls: :boolean,
      instructions_search: {:string, :generic},
      metadata: :map,
      model: {:string, :generic},
      reasoning_effort: {:enum, ["low", "medium", "high"]},
      temperature: :number,
      top_p: :number,
      type: {:const, "responses"},
      users: [string: :generic]
    ]
  end
end
