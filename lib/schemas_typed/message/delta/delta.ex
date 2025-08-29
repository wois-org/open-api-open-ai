defmodule OpenAi.Message.Delta.Delta do
  @moduledoc """
  Provides struct and type for a Message.Delta.Delta
  """
  @type t :: %__MODULE__{
          index: integer(),
          role: String.t(),
          content: [
            OpenAi.Message.Delta.Content.Image.File.t()
            | OpenAi.Message.Delta.Content.Image.Url.t()
            | OpenAi.Message.Delta.Content.Text.t()
          ]
        }
  @derive {Jason.Encoder, only: [:index, :role, :content]}
  defstruct [
    :index,
    :role,
    :content
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      index: :integer,
      role: {:string, :generic},
      content: [
        union: [
          {OpenAi.Message.Delta.Content.Image.File, :t},
          {OpenAi.Message.Delta.Content.Image.Url, :t},
          {OpenAi.Message.Delta.Content.Text, :t}
        ]
      ]
    ]
  end
end
