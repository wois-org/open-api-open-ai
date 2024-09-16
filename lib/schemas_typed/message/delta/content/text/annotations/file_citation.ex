defmodule OpenAi.Message.Delta.Content.Text.Annotations.FileCitation do
  @moduledoc """
  MessageDeltaContentTextAnnotationsFileCitationObject:
    title: File citation
    type: object
    description: A citation within the message that points to a specific quote from a specific File associated with the assistant or the message. Generated when the assistant uses the "file_search" tool to search files.
    properties:
        index:
            type: integer
            description: The index of the annotation in the text content part.
        type:
            description: Always `file_citation`.
            type: string
            enum: ["file_citation"]
        text:
            description: The text in the message content that needs to be replaced.
            type: string
        file_citation:
            type: object
            properties:
                file_id:
                    description: The ID of the specific File the citation is from.
                    type: string
                quote:
                    description: The specific quote in the file.
                    type: string
        start_index:
            type: integer
            minimum: 0
        end_index:
            type: integer
            minimum: 0
    required:
        - index
        - type
  """

  @type t :: %__MODULE__{
          index: integer(),
          type: String.t(),
          text: String.t(),
          file_citation:
            OpenAi.Message.Delta.Content.Text.Annotations.FileCitationFileCitation.t(),
          start_index: integer(),
          end_index: integer()
        }

  defstruct [:index, :type, :text, :file_citation, :start_index, :end_index]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      index: :integer,
      type: {:const, "file_citation"},
      text: {:string, :generic},
      file_citation: {OpenAi.Message.Delta.Content.Text.Annotations.FileCitationFileCitation, :t},
      start_index: :integer,
      end_index: :integer
    ]
  end
end
