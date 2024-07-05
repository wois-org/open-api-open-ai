defmodule OpenAi.Run.Step.DetailsToolCallsCodeOutputImage do
  @moduledoc """
  Provides struct and type for a Run.Step.DetailsToolCallsCodeOutputImage
  """

  @type t :: %__MODULE__{
          image: OpenAi.Run.Step.DetailsToolCallsCodeOutputImageImage.t(),
          type: String.t()
        }

  defstruct [:image, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [image: {OpenAi.Run.Step.DetailsToolCallsCodeOutputImageImage, :t}, type: {:const, "image"}]
  end
end
