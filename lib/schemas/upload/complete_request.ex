defmodule OpenAi.Upload.CompleteRequest do
  @moduledoc """
  Provides struct and type for a Upload.CompleteRequest
  """

  @type t :: %__MODULE__{md5: String.t() | nil, part_ids: [String.t()]}

  defstruct [:md5, :part_ids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [md5: {:string, :generic}, part_ids: [string: :generic]]
  end
end
