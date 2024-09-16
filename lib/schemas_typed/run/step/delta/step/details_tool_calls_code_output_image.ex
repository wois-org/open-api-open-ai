defmodule OpenAi.Run.Step.Delta.Step.DetailsToolCallsCodeOutputImage do
  @moduledoc """
  Provides struct and type for a Run.Step.Delta.Step.DetailsToolCallsCodeOutputImage

  RunStepDeltaStepDetailsToolCallsCodeOutputImageObject:
    title: Code interpreter image output
    type: object
    properties:
        index:
            type: integer
            description: The index of the output in the outputs array.
        type:
            description: Always `image`.
            type: string
            enum: ["image"]
        image:
            type: object
            properties:
                file_id:
                    description: The [file](https://platform.openai.com/docs/api-reference/files) ID of the image.
                    type: string
    required:
        - index
        - type
  """

  @type t :: %__MODULE__{
          index: integer(),
          type: String.t(),
          image: OpenAi.Run.Step.Delta.Step.DetailsToolCallsCodeOutputImageImage.t()
        }

  defstruct [:index, :type, :image]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      index: :integer,
      type: {:const, "image"},
      image: {OpenAi.Run.Step.Delta.Step.DetailsToolCallsCodeOutputImageImage, :t}
    ]
  end
end
