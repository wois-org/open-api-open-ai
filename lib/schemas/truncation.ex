defmodule OpenAi.Truncation do
  @moduledoc """
  Provides struct and type for a Truncation
  """

  @type t :: %__MODULE__{last_messages: integer | nil, type: String.t()}

  defstruct [:last_messages, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [last_messages: :integer, type: {:enum, ["auto", "last_messages"]}]
  end
end
