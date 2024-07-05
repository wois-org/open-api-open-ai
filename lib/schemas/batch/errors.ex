defmodule OpenAi.Batch.Errors do
  @moduledoc """
  Provides struct and type for a Batch.Errors
  """

  @type t :: %__MODULE__{data: [OpenAi.Batch.ErrorsData.t()] | nil, object: String.t() | nil}

  defstruct [:data, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{OpenAi.Batch.ErrorsData, :t}], object: {:string, :generic}]
  end
end
