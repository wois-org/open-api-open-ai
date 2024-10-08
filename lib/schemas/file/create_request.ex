defmodule OpenAi.File.CreateRequest do
  @moduledoc """
  Provides struct and type for a File.CreateRequest
  """

  @type t :: %__MODULE__{file: String.t(), purpose: String.t()}

  defstruct [:file, :purpose]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [file: {:string, :generic}, purpose: {:enum, ["assistants", "batch", "fine-tune", "vision"]}]
  end
end
