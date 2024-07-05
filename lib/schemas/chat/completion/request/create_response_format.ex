defmodule OpenAi.Chat.Completion.Request.CreateResponseFormat do
  @moduledoc """
  Provides struct and type for a Chat.Completion.Request.CreateResponseFormat
  """

  @type t :: %__MODULE__{type: String.t() | nil}

  defstruct [:type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:enum, ["text", "json_object"]}]
  end
end
