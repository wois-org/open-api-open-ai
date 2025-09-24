defmodule OpenAi.FineTuning.CheckpointPermission.CreateRequest do
  @moduledoc """
  Provides struct and type for a FineTuning.CheckpointPermission.CreateRequest
  """

  @type t :: %__MODULE__{project_ids: [String.t()]}

  defstruct [:project_ids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [project_ids: [string: :generic]]
  end
end
