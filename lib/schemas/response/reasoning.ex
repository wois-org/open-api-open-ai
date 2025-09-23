defmodule OpenAi.Response.Reasoning do
  @moduledoc """
  Provides struct and type for a Response.Reasoning
  """

  @type t :: %__MODULE__{
          effort: String.t() | nil,
          generate_summary: String.t() | nil,
          summary: String.t() | nil
        }

  defstruct [:effort, :generate_summary, :summary]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      effort: {:enum, ["low", "medium", "high"]},
      generate_summary: {:enum, ["auto", "concise", "detailed"]},
      summary: {:enum, ["auto", "concise", "detailed"]}
    ]
  end
end
