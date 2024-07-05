defmodule OpenAi.Message.CreateRequest do
  @moduledoc """
  Provides struct and type for a Message.CreateRequest
  """

  @type t :: %__MODULE__{
          attachments: [OpenAi.Message.CreateRequest.Attachment.t()] | nil,
          content:
            String.t()
            | [map | OpenAi.Message.Content.Image.File.t() | OpenAi.Message.Content.Image.Url.t()],
          metadata: map | nil,
          role: String.t()
        }

  defstruct [:attachments, :content, :metadata, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attachments: [{OpenAi.Message.CreateRequest.Attachment, :t}],
      content:
        {:union,
         [
           {:string, :generic},
           [
             union: [
               :map,
               {OpenAi.Message.Content.Image.File, :t},
               {OpenAi.Message.Content.Image.Url, :t}
             ]
           ]
         ]},
      metadata: :map,
      role: {:enum, ["user", "assistant"]}
    ]
  end
end
