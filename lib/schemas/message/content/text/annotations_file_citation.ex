defmodule OpenAi.Message.Content.Text.AnnotationsFileCitation do
  @moduledoc """
  Provides struct and type for a Message.Content.Text.AnnotationsFileCitation
  """

  @type t :: %__MODULE__{
          end_index: integer,
          file_citation: OpenAi.Message.Content.Text.AnnotationsFileCitationFileCitation.t(),
          start_index: integer,
          text: String.t(),
          type: String.t()
        }

  defstruct [:end_index, :file_citation, :start_index, :text, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      end_index: :integer,
      file_citation: {OpenAi.Message.Content.Text.AnnotationsFileCitationFileCitation, :t},
      start_index: :integer,
      text: {:string, :generic},
      type: {:const, "file_citation"}
    ]
  end
end
