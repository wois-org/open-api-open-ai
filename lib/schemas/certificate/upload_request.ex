defmodule OpenAi.Certificate.UploadRequest do
  @moduledoc """
  Provides struct and type for a Certificate.UploadRequest
  """

  @type t :: %__MODULE__{content: String.t(), name: String.t() | nil}

  defstruct [:content, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [content: {:string, :generic}, name: {:string, :generic}]
  end
end
