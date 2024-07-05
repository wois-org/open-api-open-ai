defmodule OpenAi.Run.UpdateRequest do
  @moduledoc """
  Provides struct and type for a Run.UpdateRequest
  """

  @type t :: %__MODULE__{metadata: map | nil}

  defstruct [:metadata]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [metadata: :map]
  end
end
