defmodule OpenAi.Invite.Request do
  @moduledoc """
  Provides struct and type for a Invite.Request
  """

  @type t :: %__MODULE__{
          email: String.t(),
          projects: [OpenAi.Invite.RequestProjects.t()] | nil,
          role: String.t()
        }

  defstruct [:email, :projects, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:string, :generic},
      projects: [{OpenAi.Invite.RequestProjects, :t}],
      role: {:enum, ["reader", "owner"]}
    ]
  end
end
