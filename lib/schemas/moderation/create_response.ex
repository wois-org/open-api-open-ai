defmodule OpenAi.Moderation.CreateResponse do
  @moduledoc """
  Provides struct and type for a Moderation.CreateResponse
  """

  @type t :: %__MODULE__{
          id: String.t(),
          model: String.t(),
          results: [OpenAi.Moderation.CreateResponse.Result.t()]
        }

  defstruct [:id, :model, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      model: {:string, :generic},
      results: [{OpenAi.Moderation.CreateResponse.Result, :t}]
    ]
  end
end
