defmodule OpenAi.Eval.Item do
  @moduledoc """
  Provides struct and type for a Eval.Item
  """

  @type t :: %__MODULE__{
          content:
            OpenAi.Response.Input.TextContent.t() | OpenAi.Response.Output.Text.t() | String.t(),
          role: String.t(),
          type: String.t() | nil
        }

  defstruct [:content, :role, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content:
        {:union,
         [
           {OpenAi.Response.Input.TextContent, :t},
           {OpenAi.Response.Output.Text, :t},
           string: :generic
         ]},
      role: {:enum, ["user", "assistant", "system", "developer"]},
      type: {:const, "message"}
    ]
  end
end
