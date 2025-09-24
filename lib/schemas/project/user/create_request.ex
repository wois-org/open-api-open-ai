defmodule OpenAi.Project.User.CreateRequest do
  @moduledoc """
  Provides struct and type for a Project.User.CreateRequest
  """

  @type t :: %__MODULE__{role: String.t(), user_id: String.t()}

  defstruct [:role, :user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [role: {:enum, ["owner", "member"]}, user_id: {:string, :generic}]
  end
end
