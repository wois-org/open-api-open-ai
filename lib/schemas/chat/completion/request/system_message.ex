defmodule OpenAi.Chat.Completion.Request.SystemMessage do
  @moduledoc """
  Provides struct and type for a Chat.Completion.Request.SystemMessage
  """

  @type t :: %__MODULE__{content: String.t(), name: String.t() | nil, role: String.t()}

  defstruct [:content, :name, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [content: {:string, :generic}, name: {:string, :generic}, role: {:const, "system"}]
  end
end
