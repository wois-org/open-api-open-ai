defmodule OpenAi.Message.Delta.Content.Text.Annotations.FilePath do
  @moduledoc """
  MessageDeltaContentTextAnnotationsFilePathObject:
    title: File path
    type: object
    description: A URL for the file that's generated when the assistant used the `code_interpreter` tool to generate a file.
    properties:
        index:
            type: integer
            description: The index of the annotation in the text content part.
        type:
            description: Always `file_path`.
            type: string
            enum: ["file_path"]
        text:
            description: The text in the message content that needs to be replaced.
            type: string
        file_path:
            type: object
            properties:
                file_id:
                    description: The ID of the file that was generated.
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
          file_path: OpenAi.Message.Delta.Content.Text.Annotations.FilePathFilePath.t(),
          start_index: integer(),
          end_index: integer()
        }

  defstruct [:index, :type, :text, :file_path, :start_index, :end_index]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      index: :integer,
      type: {:const, "file_path"},
      text: {:string, :generic},
      file_path: {OpenAi.Message.Delta.Content.Text.Annotations.FilePathFilePath, :t},
      start_index: :integer,
      end_index: :integer
    ]
  end
end
