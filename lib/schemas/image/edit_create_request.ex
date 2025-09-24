defmodule OpenAi.Image.EditCreateRequest do
  @moduledoc """
  Provides struct and type for a Image.EditCreateRequest
  """

  @type t :: %__MODULE__{
          image: String.t() | [String.t()],
          mask: String.t() | nil,
          model: String.t() | nil,
          n: integer | nil,
          prompt: String.t(),
          quality: String.t() | nil,
          response_format: String.t() | nil,
          size: String.t() | nil,
          user: String.t() | nil
        }

  defstruct [:image, :mask, :model, :n, :prompt, :quality, :response_format, :size, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      image: {:union, [{:string, :generic}, [string: :generic]]},
      mask: {:string, :generic},
      model: {:union, enum: ["dall-e-2", "gpt-image-1"], string: :generic},
      n: :integer,
      prompt: {:string, :generic},
      quality: {:enum, ["standard", "low", "medium", "high", "auto"]},
      response_format: {:enum, ["url", "b64_json"]},
      size: {:enum, ["256x256", "512x512", "1024x1024", "1536x1024", "1024x1536", "auto"]},
      user: {:string, :generic}
    ]
  end
end
