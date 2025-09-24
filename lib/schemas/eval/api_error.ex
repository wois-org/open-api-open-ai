defmodule OpenAi.Eval.ApiError do
  @moduledoc """
  Provides struct and type for a Eval.ApiError
  """

  @type t :: %__MODULE__{code: String.t(), message: String.t()}

  defstruct [:code, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: {:string, :generic}, message: {:string, :generic}]
  end
end
