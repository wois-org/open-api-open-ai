defmodule OpenAi.Run.Step.DetailsToolCallsFileSearch do
  @moduledoc """
  Provides struct and type for a Run.Step.DetailsToolCallsFileSearch
  """

  @type t :: %__MODULE__{file_search: map, id: String.t(), type: String.t()}

  defstruct [:file_search, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [file_search: :map, id: {:string, :generic}, type: {:const, "file_search"}]
  end
end
