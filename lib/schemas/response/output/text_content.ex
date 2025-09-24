defmodule OpenAi.Response.Output.TextContent do
  @moduledoc """
  Provides struct and type for a Response.Output.TextContent
  """

  @type t :: %__MODULE__{
          annotations: [
            OpenAi.File.CitationBody.t()
            | OpenAi.File.Path.t()
            | OpenAi.Response.UrlCitationBody.t()
          ],
          text: String.t(),
          type: String.t()
        }

  defstruct [:annotations, :text, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      annotations: [
        union: [
          {OpenAi.File.CitationBody, :t},
          {OpenAi.File.Path, :t},
          {OpenAi.Response.UrlCitationBody, :t}
        ]
      ],
      text: {:string, :generic},
      type: {:const, "output_text"}
    ]
  end
end
