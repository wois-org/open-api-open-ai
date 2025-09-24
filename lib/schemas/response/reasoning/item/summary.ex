defmodule OpenAi.Response.Reasoning.Item.Summary do
  @moduledoc """
  Provides struct and type for a Response.Reasoning.Item.Summary
  """

  @type t :: %__MODULE__{text: String.t(), type: String.t()}

  defstruct [:text, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [text: {:string, :generic}, type: {:const, "summary_text"}]
  end
end
