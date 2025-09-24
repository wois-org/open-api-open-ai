defmodule OpenAi.Image.CreateRequest do
  @moduledoc """
  Provides struct and type for a Image.CreateRequest
  """

  @type t :: %__MODULE__{
          background: String.t() | nil,
          model: String.t() | nil,
          moderation: String.t() | nil,
          n: integer | nil,
          output_compression: integer | nil,
          output_format: String.t() | nil,
          prompt: String.t(),
          quality: String.t() | nil,
          response_format: String.t() | nil,
          size: String.t() | nil,
          style: String.t() | nil,
          user: String.t() | nil
        }

  defstruct [
    :background,
    :model,
    :moderation,
    :n,
    :output_compression,
    :output_format,
    :prompt,
    :quality,
    :response_format,
    :size,
    :style,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      background: {:enum, ["transparent", "opaque", "auto"]},
      model: {:union, enum: ["dall-e-2", "dall-e-3", "gpt-image-1"], string: :generic},
      moderation: {:enum, ["low", "auto"]},
      n: :integer,
      output_compression: :integer,
      output_format: {:enum, ["png", "jpeg", "webp"]},
      prompt: {:string, :generic},
      quality: {:enum, ["standard", "hd", "low", "medium", "high", "auto"]},
      response_format: {:enum, ["url", "b64_json"]},
      size:
        {:enum,
         [
           "auto",
           "1024x1024",
           "1536x1024",
           "1024x1536",
           "256x256",
           "512x512",
           "1792x1024",
           "1024x1792"
         ]},
      style: {:enum, ["vivid", "natural"]},
      user: {:string, :generic}
    ]
  end
end
