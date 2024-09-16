defmodule OpenAi.Message.Delta.Content.Text.Annotations.FileCitationFileCitation do
  @moduledoc """
  Provides struct and type for a Message.Delta.Content.Text.Annotations.FileCitation.FileCitation
  """
  @type t :: %__MODULE__{
          file_id: String.t(),
          quote: String.t()
        }

  defstruct [:file_id, :quote]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      file_id: {:string, :generic},
      quote: {:string, :generic}
    ]
  end
end
