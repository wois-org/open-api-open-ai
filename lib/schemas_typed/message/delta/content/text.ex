defmodule OpenAi.Message.Delta.Content.Text do
  @moduledoc """
  MessageDeltaContentTextObject:
    title: Text
    type: object
    description: The text content that is part of a message.
    properties:
        index:
            type: integer
            description: The index of the content part in the message.
        type:
            description: Always `text`.
            type: string
            enum: ["text"]
        text:
            type: object
            properties:
                value:
                    description: The data that makes up the text.
                    type: string
                annotations:
                    type: array
                    items:
                        oneOf:
                            - $ref: "#/components/schemas/MessageDeltaContentTextAnnotationsFileCitationObject"
                            - $ref: "#/components/schemas/MessageDeltaContentTextAnnotationsFilePathObject"
                        x-oaiExpandable: true
    required:
        - index
        - type
  """

  @type t :: %__MODULE__{
          index: integer(),
          type: String.t(),
          text: OpenAi.Message.Delta.Content.Text.Text.t()
        }
  @derive {Jason.Encoder, only: [:index, :type, :text]}
  defstruct [:index, :type, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      index: :integer,
      type: {:const, "text"},
      text: {OpenAi.Message.Delta.Content.Text.Text, :t}
    ]
  end
end
