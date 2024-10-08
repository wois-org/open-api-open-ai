defmodule OpenAi.Thread.CreateRequest.ToolResourcesCodeInterpreter do
  @moduledoc """
  Provides struct and type for a Thread.CreateRequest.ToolResourcesCodeInterpreter
  """

  @type t :: %__MODULE__{file_ids: [String.t()] | nil}

  defstruct [:file_ids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [file_ids: [string: :generic]]
  end
end
