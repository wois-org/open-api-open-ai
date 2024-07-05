defmodule OpenAi.VectorStore.File.LastError do
  @moduledoc """
  Provides struct and type for a VectorStore.File.LastError
  """

  @type t :: %__MODULE__{code: String.t(), message: String.t()}

  defstruct [:code, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: {:enum, ["internal_error", "file_not_found", "parsing_error", "unhandled_mime_type"]},
      message: {:string, :generic}
    ]
  end
end
