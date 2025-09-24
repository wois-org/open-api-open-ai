defmodule OpenAi.Eval.InputMessage.Template do
  @moduledoc """
  Provides struct and type for a Eval.InputMessage.Template
  """

  @type t :: %__MODULE__{
          template: [OpenAi.Eval.Item.t() | OpenAi.Response.Input.MessageEasy.t()],
          type: String.t()
        }

  defstruct [:template, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      template: [union: [{OpenAi.Eval.Item, :t}, {OpenAi.Response.Input.MessageEasy, :t}]],
      type: {:const, "template"}
    ]
  end
end
