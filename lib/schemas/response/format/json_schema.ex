defmodule OpenAi.Response.Format.JsonSchema do
  @moduledoc """
  Provides struct and type for a Response.Format.JsonSchema
  """

  @type t :: %__MODULE__{json_schema: OpenAi.Response.JSONSchema.t(), type: String.t()}

  defstruct [:json_schema, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [json_schema: {OpenAi.Response.JSONSchema, :t}, type: {:const, "json_schema"}]
  end
end
