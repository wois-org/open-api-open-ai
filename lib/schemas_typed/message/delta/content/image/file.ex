defmodule OpenAi.Message.Delta.Content.Image.File do
  @moduledoc """
  MessageDeltaContentImageFileObject:
    title: Image file
    type: object
    description: References an image [File](https://platform.openai.com/docs/api-reference/files) in the content of a message.
    properties:
        index:
            type: integer
            description: The index of the content part in the message.
        type:
            description: Always `image_file`.
            type: string
            enum: ["image_file"]
        image_file:
            type: object
            properties:
                file_id:
                    description: The [File](https://platform.openai.com/docs/api-reference/files) ID of the image in the message content. Set `purpose="vision"` when uploading the File if you need to later display the file content.
                    type: string
                detail:
                    type: string
                    description: Specifies the detail level of the image if specified by the user. `low` uses fewer tokens, you can opt in to high resolution using `high`.
                    enum: ["auto", "low", "high"]
                    default: "auto"
    required:
        - index
        - type
  """

  @type t :: %__MODULE__{
          index: integer(),
          type: String.t(),
          image_file: OpenAi.Message.Delta.Content.Image.FileImageFile.t()
        }
  @derive {Jason.Encoder, only: [:index, :type, :image_file]}
  defstruct [:index, :type, :image_file]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      index: :integer,
      type: {:const, "image_file"},
      image_file: {OpenAi.Message.Delta.Content.Image.FileImageFile, :t}
    ]
  end
end
