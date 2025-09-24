defmodule OpenAi.Response.Usage.InputTokensDetails do
  @moduledoc """
  Provides struct and type for a Response.Usage.InputTokensDetails
  """

  @type t :: %__MODULE__{cached_tokens: integer}

  defstruct [:cached_tokens]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [cached_tokens: :integer]
  end
end
