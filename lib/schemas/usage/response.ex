defmodule OpenAi.Usage.Response do
  @moduledoc """
  Provides struct and type for a Usage.Response
  """

  @type t :: %__MODULE__{
          data: [OpenAi.Usage.TimeBucket.t()],
          has_more: boolean,
          next_page: String.t(),
          object: String.t()
        }

  defstruct [:data, :has_more, :next_page, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{OpenAi.Usage.TimeBucket, :t}],
      has_more: :boolean,
      next_page: {:string, :generic},
      object: {:const, "page"}
    ]
  end
end
