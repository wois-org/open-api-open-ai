defmodule OpenAi.Image.Response do
  @moduledoc """
  Provides struct and type for a Image.Response
  """

  @type t :: %__MODULE__{
          created: integer,
          data: [OpenAi.Image.t()] | nil,
          usage: OpenAi.Image.Response.Usage.t() | nil
        }

  defstruct [:created, :data, :usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [created: :integer, data: [{OpenAi.Image, :t}], usage: {OpenAi.Image.Response.Usage, :t}]
  end
end
