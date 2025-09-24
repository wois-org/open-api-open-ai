defmodule OpenAi.Message.Delta.Content.Text.Text do
  @moduledoc """
  Provides struct and type for a Message.Delta.Content.Text.Text
  """
  @type t :: %__MODULE__{
          value: String.t(),
          annotations: [
            OpenAi.Message.Delta.Content.Text.Annotations.FileCitation.t()
            | OpenAi.Message.Delta.Content.Text.Annotations.FilePath.t()
          ]
        }
  @derive {Jason.Encoder, only: [:value, :annotations]}
  defstruct [:value, :annotations]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      value: {:string, :generic},
      annotations: [
        union: [
          {OpenAi.Message.Delta.Content.Text.Annotations.FileCitation, :t},
          {OpenAi.Message.Delta.Content.Text.Annotations.FilePath, :t}
        ]
      ]
    ]
  end
end
