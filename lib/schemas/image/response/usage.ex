defmodule OpenAi.Image.Response.Usage do
  @moduledoc """
  Provides struct and type for a Image.Response.Usage
  """

  @type t :: %__MODULE__{
          input_tokens: integer,
          input_tokens_details: OpenAi.Image.Response.UsageInputTokensDetails.t(),
          output_tokens: integer,
          total_tokens: integer
        }

  defstruct [:input_tokens, :input_tokens_details, :output_tokens, :total_tokens]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input_tokens: :integer,
      input_tokens_details: {OpenAi.Image.Response.UsageInputTokensDetails, :t},
      output_tokens: :integer,
      total_tokens: :integer
    ]
  end
end
