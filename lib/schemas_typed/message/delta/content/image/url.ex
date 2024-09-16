defmodule OpenAi.Message.Delta.Content.Image.Url do
  @moduledoc """
  MessageDeltaContentImageUrlObject:
    title: Image URL
    type: object
    description: References an image URL in the content of a message.
    properties:
        index:
            type: integer
            description: The index of the content part in the message.
        type:
            description: Always `image_url`.
            type: string
            enum: ["image_url"]
        image_url:
            type: object
            properties:
                url:
                    description: "The URL of the image, must be a supported image types: jpeg, jpg, png, gif, webp."
                    type: string
                detail:
                    type: string
                    description: Specifies the detail level of the image. `low` uses fewer tokens, you can opt in to high resolution using `high`.
                    enum: ["auto", "low", "high"]
                    default: "auto"
    required:
        - index
        - type
  """

  @type t :: %__MODULE__{
          index: integer(),
          type: String.t(),
          image_url: OpenAi.Message.Delta.Content.Image.UrlImageUrl.t()
        }

  defstruct [:index, :type, :image_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      index: :integer,
      type: {:const, "image_url"},
      image_url: {OpenAi.Message.Delta.Content.Image.UrlImageUrl, :t}
    ]
  end
end
