defmodule OpenAi.Model.ListResponse do
  @moduledoc """
  Provides struct and type for a Model.ListResponse
  """

  @type t :: %__MODULE__{data: [OpenAi.Model.t()], object: String.t()}

  defstruct [:data, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{OpenAi.Model, :t}], object: {:const, "list"}]
  end
end
