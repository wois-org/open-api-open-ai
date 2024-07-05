defmodule OpenAi.Message.Content.Image.Url do
  @moduledoc """
  Provides struct and type for a Message.Content.Image.Url
  """

  @type t :: %__MODULE__{
          image_url: OpenAi.Message.Content.Image.UrlImageUrl.t(),
          type: String.t()
        }

  defstruct [:image_url, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [image_url: {OpenAi.Message.Content.Image.UrlImageUrl, :t}, type: {:const, "image_url"}]
  end
end
