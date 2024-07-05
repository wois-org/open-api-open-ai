defmodule OpenAi.Message.Content.Image.UrlImageUrl do
  @moduledoc """
  Provides struct and type for a Message.Content.Image.UrlImageUrl
  """

  @type t :: %__MODULE__{detail: String.t() | nil, url: String.t()}

  defstruct [:detail, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [detail: {:enum, ["auto", "low", "high"]}, url: {:string, :uri}]
  end
end
