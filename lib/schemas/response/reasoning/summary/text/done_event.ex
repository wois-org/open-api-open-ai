defmodule OpenAi.Response.Reasoning.Summary.Text.DoneEvent do
  @moduledoc """
  Provides struct and type for a Response.Reasoning.Summary.Text.DoneEvent
  """

  @type t :: %__MODULE__{
          item_id: String.t(),
          output_index: integer,
          summary_index: integer,
          text: String.t(),
          type: String.t()
        }

  defstruct [:item_id, :output_index, :summary_index, :text, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      item_id: {:string, :generic},
      output_index: :integer,
      summary_index: :integer,
      text: {:string, :generic},
      type: {:const, "response.reasoning_summary_text.done"}
    ]
  end
end
