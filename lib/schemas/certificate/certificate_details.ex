defmodule OpenAi.Certificate.CertificateDetails do
  @moduledoc """
  Provides struct and type for a Certificate.CertificateDetails
  """

  @type t :: %__MODULE__{
          content: String.t() | nil,
          expires_at: integer | nil,
          valid_at: integer | nil
        }

  defstruct [:content, :expires_at, :valid_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [content: {:string, :generic}, expires_at: :integer, valid_at: :integer]
  end
end
