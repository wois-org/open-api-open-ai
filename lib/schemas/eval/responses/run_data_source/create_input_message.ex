defmodule OpenAi.Eval.Responses.RunDataSource.CreateInputMessage do
  @moduledoc """
  Provides struct and types for a Eval.Responses.RunDataSource.CreateInputMessage
  """

  @type t :: %__MODULE__{
          item_reference: String.t(),
          template: [OpenAi.Chat.Message.t() | OpenAi.Eval.Item.t()],
          type: String.t()
        }

  defstruct [:item_reference, :template, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      item_reference: {:string, :generic},
      template: [union: [{OpenAi.Chat.Message, :t}, {OpenAi.Eval.Item, :t}]],
      type: {:enum, ["item_reference", "template"]}
    ]
  end
end
