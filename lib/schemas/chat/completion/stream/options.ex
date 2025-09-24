defmodule OpenAi.Chat.Completion.Stream.Options do
  @moduledoc """
  Provides struct and type for a Chat.Completion.Stream.Options
  """

  @type t :: %__MODULE__{include_usage: boolean | nil}

  defstruct [:include_usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [include_usage: :boolean]
  end
end
