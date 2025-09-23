defmodule OpenAi.Response.Reasoning.Summary.Part.DoneEvent do
  @moduledoc """
  Provides struct and type for a Response.Reasoning.Summary.Part.DoneEvent
  """

  @type t :: %__MODULE__{
          item_id: String.t(),
          output_index: integer,
          part: OpenAi.Response.Reasoning.Summary.Part.DoneEventPart.t(),
          summary_index: integer,
          type: String.t()
        }

  defstruct [:item_id, :output_index, :part, :summary_index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      item_id: {:string, :generic},
      output_index: :integer,
      part: {OpenAi.Response.Reasoning.Summary.Part.DoneEventPart, :t},
      summary_index: :integer,
      type: {:const, "response.reasoning_summary_part.done"}
    ]
  end
end
