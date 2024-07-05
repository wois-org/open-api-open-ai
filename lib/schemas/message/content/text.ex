defmodule OpenAi.Message.Content.Text do
  @moduledoc """
  Provides struct and type for a Message.Content.Text
  """

  @type t :: %__MODULE__{text: OpenAi.Message.Content.Text.Text.t(), type: String.t()}

  defstruct [:text, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [text: {OpenAi.Message.Content.Text.Text, :t}, type: {:const, "text"}]
  end
end
