defmodule OpenAi.Message do
  @moduledoc """
  Provides struct and type for a Message
  """

  @type t :: %__MODULE__{
          assistant_id: String.t() | nil,
          attachments: [OpenAi.Message.Attachment.t()] | nil,
          completed_at: integer | nil,
          content: [
            OpenAi.Message.Content.Image.File.t()
            | OpenAi.Message.Content.Image.Url.t()
            | OpenAi.Message.Content.Text.t()
          ],
          created_at: integer,
          id: String.t(),
          incomplete_at: integer | nil,
          incomplete_details: OpenAi.Message.IncompleteDetails.t() | nil,
          metadata: map | nil,
          object: String.t(),
          role: String.t(),
          run_id: String.t() | nil,
          status: String.t(),
          thread_id: String.t()
        }

  defstruct [
    :assistant_id,
    :attachments,
    :completed_at,
    :content,
    :created_at,
    :id,
    :incomplete_at,
    :incomplete_details,
    :metadata,
    :object,
    :role,
    :run_id,
    :status,
    :thread_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assistant_id: {:string, :generic},
      attachments: [{OpenAi.Message.Attachment, :t}],
      completed_at: :integer,
      content: [
        union: [
          {OpenAi.Message.Content.Image.File, :t},
          {OpenAi.Message.Content.Image.Url, :t},
          {OpenAi.Message.Content.Text, :t}
        ]
      ],
      created_at: :integer,
      id: {:string, :generic},
      incomplete_at: :integer,
      incomplete_details: {OpenAi.Message.IncompleteDetails, :t},
      metadata: :map,
      object: {:const, "thread.message"},
      role: {:enum, ["user", "assistant"]},
      run_id: {:string, :generic},
      status: {:enum, ["in_progress", "incomplete", "completed"]},
      thread_id: {:string, :generic}
    ]
  end
end
