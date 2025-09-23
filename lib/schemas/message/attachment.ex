defmodule OpenAi.Message.Attachment do
  @moduledoc """
  Provides struct and type for a Message.Attachment
  """

  @type t :: %__MODULE__{
          file_id: String.t() | nil,
          tools:
            [OpenAi.Assistant.Tool.Code.t() | OpenAi.Assistant.Tool.FileSearch.TypeOnly.t()] | nil
        }

  defstruct [:file_id, :tools]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      file_id: {:string, :generic},
      tools: [
        union: [{OpenAi.Assistant.Tool.Code, :t}, {OpenAi.Assistant.Tool.FileSearch.TypeOnly, :t}]
      ]
    ]
  end
end
