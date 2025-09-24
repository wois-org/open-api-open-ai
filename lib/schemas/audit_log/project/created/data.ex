defmodule OpenAi.AuditLog.Project.Created.Data do
  @moduledoc """
  Provides struct and type for a AuditLog.Project.Created.Data
  """

  @type t :: %__MODULE__{name: String.t() | nil, title: String.t() | nil}

  defstruct [:name, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, title: {:string, :generic}]
  end
end
