defmodule OpenAi.Response.CompletedEvent do
  @moduledoc """
  Provides struct and type for a Response.CompletedEvent
  """

  @type t :: %__MODULE__{response: OpenAi.Response.t(), type: String.t()}

  defstruct [:response, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [response: {OpenAi.Response, :t}, type: {:const, "response.completed"}]
  end
end
