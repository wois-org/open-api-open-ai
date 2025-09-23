defmodule OpenAi.Certificate.ToggleRequest do
  @moduledoc """
  Provides struct and type for a Certificate.ToggleRequest
  """

  @type t :: %__MODULE__{certificate_ids: [String.t()]}

  defstruct [:certificate_ids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [certificate_ids: [string: :generic]]
  end
end
