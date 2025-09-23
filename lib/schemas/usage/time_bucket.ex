defmodule OpenAi.Usage.TimeBucket do
  @moduledoc """
  Provides struct and type for a Usage.TimeBucket
  """

  @type t :: %__MODULE__{
          end_time: integer,
          object: String.t(),
          result: [
            OpenAi.Usage.AudioSpeeches.Result.t()
            | OpenAi.Usage.AudioTranscriptions.Result.t()
            | OpenAi.Usage.CodeInterpreterSessions.Result.t()
            | OpenAi.Usage.Completions.Result.t()
            | OpenAi.Usage.Costs.Result.t()
            | OpenAi.Usage.Embeddings.Result.t()
            | OpenAi.Usage.Image.Result.t()
            | OpenAi.Usage.Moderations.Result.t()
            | OpenAi.Usage.VectorStore.Result.t()
          ],
          start_time: integer
        }

  defstruct [:end_time, :object, :result, :start_time]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      end_time: :integer,
      object: {:const, "bucket"},
      result: [
        union: [
          {OpenAi.Usage.AudioSpeeches.Result, :t},
          {OpenAi.Usage.AudioTranscriptions.Result, :t},
          {OpenAi.Usage.CodeInterpreterSessions.Result, :t},
          {OpenAi.Usage.Completions.Result, :t},
          {OpenAi.Usage.Costs.Result, :t},
          {OpenAi.Usage.Embeddings.Result, :t},
          {OpenAi.Usage.Image.Result, :t},
          {OpenAi.Usage.Moderations.Result, :t},
          {OpenAi.Usage.VectorStore.Result, :t}
        ]
      ],
      start_time: :integer
    ]
  end
end
