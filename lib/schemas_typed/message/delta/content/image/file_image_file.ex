defmodule OpenAi.Message.Delta.Content.Image.FileImageFile do
  @moduledoc """
  Provides struct and type for a Message.Delta.Content.Image.FileImageFile
  """
  @type t :: %__MODULE__{
          file_id: String.t(),
          detail: String.t()
        }

  defstruct [:file_id, :detail]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      file_id: {:string, :generic},
      detail: {:enum, ["auto", "low", "high"]}
    ]
  end
end
