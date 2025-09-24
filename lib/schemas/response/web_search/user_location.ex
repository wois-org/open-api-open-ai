defmodule OpenAi.Response.WebSearch.UserLocation do
  @moduledoc """
  Provides struct and type for a Response.WebSearch.UserLocation
  """

  @type t :: %__MODULE__{approximate: OpenAi.Response.WebSearch.Location.t(), type: String.t()}

  defstruct [:approximate, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [approximate: {OpenAi.Response.WebSearch.Location, :t}, type: {:const, "approximate"}]
  end
end
