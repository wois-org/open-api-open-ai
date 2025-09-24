defmodule OpenAi.Response.Reasoning.Item do
  @moduledoc """
  Provides struct and type for a Response.Reasoning.Item
  """

  @type t :: %__MODULE__{
          id: String.t(),
          status: String.t() | nil,
          summary: [OpenAi.Response.Reasoning.Item.Summary.t()],
          type: String.t()
        }

  defstruct [:id, :status, :summary, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      status: {:enum, ["in_progress", "completed", "incomplete"]},
      summary: [{OpenAi.Response.Reasoning.Item.Summary, :t}],
      type: {:const, "reasoning"}
    ]
  end
end
