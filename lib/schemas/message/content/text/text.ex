defmodule OpenAi.Message.Content.Text.Text do
  @moduledoc """
  Provides struct and type for a Message.Content.Text.Text
  """

  @type t :: %__MODULE__{
          annotations: [
            OpenAi.Message.Content.Text.AnnotationsFileCitation.t()
            | OpenAi.Message.Content.Text.AnnotationsFilePath.t()
          ],
          value: String.t()
        }

  defstruct [:annotations, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      annotations: [
        union: [
          {OpenAi.Message.Content.Text.AnnotationsFileCitation, :t},
          {OpenAi.Message.Content.Text.AnnotationsFilePath, :t}
        ]
      ],
      value: {:string, :generic}
    ]
  end
end
