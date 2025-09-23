defmodule OpenAi.Response.Computer.Drag do
  @moduledoc """
  Provides struct and type for a Response.Computer.Drag
  """

  @type t :: %__MODULE__{path: [OpenAi.Response.Computer.Coordinate.t()], type: String.t()}

  defstruct [:path, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [path: [{OpenAi.Response.Computer.Coordinate, :t}], type: {:const, "drag"}]
  end
end
