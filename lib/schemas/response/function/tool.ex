defmodule OpenAi.Response.Function.Tool do
  @moduledoc """
  Provides struct and type for a Response.Function.Tool
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          name: String.t(),
          parameters: OpenAi.Response.Function.ToolParameters.t() | nil,
          strict: boolean | nil,
          type: String.t()
        }

  defstruct [:description, :name, :parameters, :strict, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [{:string, :generic}, :null]},
      name: {:string, :generic},
      parameters: {:union, [{OpenAi.Response.Function.ToolParameters, :t}, :null]},
      strict: {:union, [:boolean, :null]},
      type: {:const, "function"}
    ]
  end
end
