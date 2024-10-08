defmodule OpenAi.Moderation.CreateRequest do
  @moduledoc """
  Provides struct and type for a Moderation.CreateRequest
  """

  @type t :: %__MODULE__{input: String.t() | [String.t()], model: String.t() | nil}

  defstruct [:input, :model]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input: {:union, [{:string, :generic}, [string: :generic]]},
      model:
        {:union, enum: ["text-moderation-latest", "text-moderation-stable"], string: :generic}
    ]
  end
end
