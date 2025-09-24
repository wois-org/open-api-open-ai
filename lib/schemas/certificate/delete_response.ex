defmodule OpenAi.Certificate.DeleteResponse do
  @moduledoc """
  Provides struct and type for a Certificate.DeleteResponse
  """

  @type t :: %__MODULE__{id: String.t(), object: String.t()}

  defstruct [:id, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, object: {:const, "certificate.deleted"}]
  end
end
