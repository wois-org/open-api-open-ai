defmodule OpenAi.Response.IncompleteEvent do
  @moduledoc """
  Provides struct and type for a Response.IncompleteEvent
  """

  @type t :: %__MODULE__{response: OpenAi.Response.t(), type: String.t()}

  defstruct [:response, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [response: {OpenAi.Response, :t}, type: {:const, "response.incomplete"}]
  end
end
