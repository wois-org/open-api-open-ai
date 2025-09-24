defmodule OpenAi.Eval.StoredCompletions.Source do
  @moduledoc """
  Provides struct and type for a Eval.StoredCompletions.Source
  """

  @type t :: %__MODULE__{
          created_after: integer | nil,
          created_before: integer | nil,
          limit: integer | nil,
          metadata: map | nil,
          model: String.t() | nil,
          type: String.t()
        }

  defstruct [:created_after, :created_before, :limit, :metadata, :model, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_after: :integer,
      created_before: :integer,
      limit: :integer,
      metadata: :map,
      model: {:string, :generic},
      type: {:const, "stored_completions"}
    ]
  end
end
