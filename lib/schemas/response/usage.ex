defmodule OpenAi.Response.Usage do
  @moduledoc """
  Provides struct and type for a Response.Usage
  """

  @type t :: %__MODULE__{
          input_tokens: integer,
          input_tokens_details: OpenAi.Response.Usage.InputTokensDetails.t(),
          output_tokens: integer,
          output_tokens_details: OpenAi.Response.Usage.OutputTokensDetails.t(),
          total_tokens: integer
        }

  defstruct [
    :input_tokens,
    :input_tokens_details,
    :output_tokens,
    :output_tokens_details,
    :total_tokens
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input_tokens: :integer,
      input_tokens_details: {OpenAi.Response.Usage.InputTokensDetails, :t},
      output_tokens: :integer,
      output_tokens_details: {OpenAi.Response.Usage.OutputTokensDetails, :t},
      total_tokens: :integer
    ]
  end
end
