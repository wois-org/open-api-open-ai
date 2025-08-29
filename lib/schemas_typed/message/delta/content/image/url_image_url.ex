defmodule OpenAi.Message.Delta.Content.Image.UrlImageUrl do
  @moduledoc """
  Provides struct and type for a Message.Delta.Content.Image.UrlImageUrl
  """
  @type t :: %__MODULE__{
          url: String.t(),
          detail: String.t()
        }

  @derive {Jason.Encoder, only: [:url, :detail]}
  defstruct [:url, :detail]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      url: {:string, :generic},
      detail: {:enum, ["auto", "low", "high"]}
    ]
  end
end
