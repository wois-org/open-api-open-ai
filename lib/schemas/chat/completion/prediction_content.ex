defmodule OpenAi.Chat.Completion.PredictionContent do
  @moduledoc """
  Provides struct and type for a Chat.Completion.PredictionContent
  """

  @type t :: %__MODULE__{content: String.t() | [map], type: String.t()}

  defstruct [:content, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [content: {:union, [{:string, :generic}, [:map]]}, type: {:const, "content"}]
  end
end
