defmodule OpenAi.Project.ApiKey.Owner do
  @moduledoc """
  Provides struct and type for a Project.ApiKey.Owner
  """

  @type t :: %__MODULE__{
          service_account: OpenAi.Project.ServiceAccount.t() | nil,
          type: String.t() | nil,
          user: OpenAi.Project.User.t() | nil
        }

  defstruct [:service_account, :type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      service_account: {OpenAi.Project.ServiceAccount, :t},
      type: {:enum, ["user", "service_account"]},
      user: {OpenAi.Project.User, :t}
    ]
  end
end
