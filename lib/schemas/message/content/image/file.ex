defmodule OpenAi.Message.Content.Image.File do
  @moduledoc """
  Provides struct and type for a Message.Content.Image.File
  """

  @type t :: %__MODULE__{
          image_file: OpenAi.Message.Content.Image.FileImageFile.t(),
          type: String.t()
        }

  defstruct [:image_file, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [image_file: {OpenAi.Message.Content.Image.FileImageFile, :t}, type: {:const, "image_file"}]
  end
end
