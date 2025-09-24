defmodule OpenAi.ErrorResponse do
  @moduledoc """
  Provides struct and type for a ErrorResponse
  """

  @type t :: %__MODULE__{error: OpenAi.ResError.t()}

  defstruct [:error]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [error: {OpenAi.ResError, :t}]
  end
end
