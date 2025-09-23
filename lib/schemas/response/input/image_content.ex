defmodule OpenAi.Response.Input.ImageContent do
  @moduledoc """
  Provides struct and type for a Response.Input.ImageContent
  """

  @type t :: %__MODULE__{
          detail: String.t(),
          file_id: String.t() | nil,
          image_url: String.t() | nil,
          type: String.t()
        }

  defstruct [:detail, :file_id, :image_url, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      detail: {:enum, ["low", "high", "auto"]},
      file_id: {:union, [{:string, :generic}, :null]},
      image_url: {:union, [{:string, :generic}, :null]},
      type: {:const, "input_image"}
    ]
  end
end
