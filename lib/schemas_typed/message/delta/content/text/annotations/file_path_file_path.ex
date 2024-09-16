defmodule OpenAi.Message.Delta.Content.Text.Annotations.FilePathFilePath do
  @moduledoc """
  Provides struct and type for a Message.Delta.Content.Text.Annotations.FilePath.FilePath
  """
  @type t :: %__MODULE__{
          file_path: String.t()
        }

  defstruct [:file_path]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      file_path: {:string, :generic}
    ]
  end
end
