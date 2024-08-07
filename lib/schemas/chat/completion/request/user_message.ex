defmodule OpenAi.Chat.Completion.Request.UserMessage do
  @moduledoc """
  Provides struct and type for a Chat.Completion.Request.UserMessage
  """

  @type t :: %__MODULE__{content: String.t() | [map], name: String.t() | nil, role: String.t()}

  defstruct [:content, :name, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: {:union, [{:string, :generic}, [:map]]},
      name: {:string, :generic},
      role: {:const, "user"}
    ]
  end
end
