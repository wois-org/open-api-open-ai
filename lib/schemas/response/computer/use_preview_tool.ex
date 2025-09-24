defmodule OpenAi.Response.Computer.UsePreviewTool do
  @moduledoc """
  Provides struct and type for a Response.Computer.UsePreviewTool
  """

  @type t :: %__MODULE__{
          display_height: integer,
          display_width: integer,
          environment: String.t(),
          type: String.t()
        }

  defstruct [:display_height, :display_width, :environment, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      display_height: :integer,
      display_width: :integer,
      environment: {:enum, ["windows", "mac", "linux", "ubuntu", "browser"]},
      type: {:const, "computer_use_preview"}
    ]
  end
end
