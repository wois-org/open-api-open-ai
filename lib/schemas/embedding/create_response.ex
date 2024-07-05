defmodule OpenAi.Embedding.CreateResponse do
  @moduledoc """
  Provides struct and type for a Embedding.CreateResponse
  """

  @type t :: %__MODULE__{
          data: [OpenAi.Embedding.t()],
          model: String.t(),
          object: String.t(),
          usage: OpenAi.Embedding.CreateResponse.Usage.t()
        }

  defstruct [:data, :model, :object, :usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{OpenAi.Embedding, :t}],
      model: {:string, :generic},
      object: {:const, "list"},
      usage: {OpenAi.Embedding.CreateResponse.Usage, :t}
    ]
  end
end
