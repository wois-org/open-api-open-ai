defmodule OpenAi.Image.Response.UsageInputTokensDetails do
  @moduledoc """
  Provides struct and type for a Image.Response.UsageInputTokensDetails
  """

  @type t :: %__MODULE__{image_tokens: integer, text_tokens: integer}

  defstruct [:image_tokens, :text_tokens]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [image_tokens: :integer, text_tokens: :integer]
  end
end
