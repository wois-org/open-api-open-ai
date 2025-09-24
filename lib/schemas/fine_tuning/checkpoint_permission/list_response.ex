defmodule OpenAi.FineTuning.CheckpointPermission.ListResponse do
  @moduledoc """
  Provides struct and type for a FineTuning.CheckpointPermission.ListResponse
  """

  @type t :: %__MODULE__{
          data: [OpenAi.FineTuning.CheckpointPermission.t()],
          first_id: String.t() | nil,
          has_more: boolean,
          last_id: String.t() | nil,
          object: String.t()
        }

  defstruct [:data, :first_id, :has_more, :last_id, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{OpenAi.FineTuning.CheckpointPermission, :t}],
      first_id: {:string, :generic},
      has_more: :boolean,
      last_id: {:string, :generic},
      object: {:const, "list"}
    ]
  end
end
