defmodule OpenAi.Response.FileSearch.Tool.CallResult do
  @moduledoc """
  Provides struct and type for a Response.FileSearch.Tool.CallResult
  """

  @type t :: %__MODULE__{
          attributes: OpenAi.VectorStore.File.Attributes.t() | nil,
          file_id: String.t() | nil,
          filename: String.t() | nil,
          score: number | nil,
          text: String.t() | nil
        }

  defstruct [:attributes, :file_id, :filename, :score, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {OpenAi.VectorStore.File.Attributes, :t},
      file_id: {:string, :generic},
      filename: {:string, :generic},
      score: :number,
      text: {:string, :generic}
    ]
  end
end
