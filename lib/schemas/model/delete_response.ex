defmodule OpenAi.Model.DeleteResponse do
  @moduledoc """
  Provides struct and type for a Model.DeleteResponse
  """

  @type t :: %__MODULE__{deleted: boolean, id: String.t(), object: String.t()}

  defstruct [:deleted, :id, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [deleted: :boolean, id: {:string, :generic}, object: {:string, :generic}]
  end
end
