defmodule OpenAi.FineTuning.Job.Event do
  @moduledoc """
  Provides struct and type for a FineTuning.Job.Event
  """

  @type t :: %__MODULE__{
          created_at: integer,
          id: String.t(),
          level: String.t(),
          message: String.t(),
          object: String.t()
        }

  defstruct [:created_at, :id, :level, :message, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      id: {:string, :generic},
      level: {:enum, ["info", "warn", "error"]},
      message: {:string, :generic},
      object: {:const, "fine_tuning.job.event"}
    ]
  end
end
