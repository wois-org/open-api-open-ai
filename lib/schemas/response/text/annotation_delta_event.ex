defmodule OpenAi.Response.Text.AnnotationDeltaEvent do
  @moduledoc """
  Provides struct and type for a Response.Text.AnnotationDeltaEvent
  """

  @type t :: %__MODULE__{
          annotation:
            OpenAi.File.CitationBody.t()
            | OpenAi.File.Path.t()
            | OpenAi.Response.UrlCitationBody.t(),
          annotation_index: integer,
          content_index: integer,
          item_id: String.t(),
          output_index: integer,
          type: String.t()
        }

  defstruct [:annotation, :annotation_index, :content_index, :item_id, :output_index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      annotation:
        {:union,
         [
           {OpenAi.File.CitationBody, :t},
           {OpenAi.File.Path, :t},
           {OpenAi.Response.UrlCitationBody, :t}
         ]},
      annotation_index: :integer,
      content_index: :integer,
      item_id: {:string, :generic},
      output_index: :integer,
      type: {:const, "response.output_text.annotation.added"}
    ]
  end
end
