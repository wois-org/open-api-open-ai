defmodule OpenAi.Response.Input.MessageEasy do
  @moduledoc """
  Provides struct and type for a Response.Input.MessageEasy
  """

  @type t :: %__MODULE__{
          content:
            String.t()
            | [
                OpenAi.Response.Input.FileContent.t()
                | OpenAi.Response.Input.ImageContent.t()
                | OpenAi.Response.Input.TextContent.t()
              ],
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
           {:string, :generic},
           [
             union: [
               {OpenAi.Response.Input.FileContent, :t},
               {OpenAi.Response.Input.ImageContent, :t},
               {OpenAi.Response.Input.TextContent, :t}
             ]
           ]
         ]},
      role: {:enum, ["user", "assistant", "system", "developer"]},
      type: {:const, "message"}
    ]
  end
end
