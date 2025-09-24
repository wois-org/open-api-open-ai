defmodule OpenAi.Response.Input.FileContent do
  @moduledoc """
  Provides struct and type for a Response.Input.FileContent
  """

  @type t :: %__MODULE__{
          file_data: String.t() | nil,
          file_id: String.t() | nil,
          filename: String.t() | nil,
          type: String.t()
        }

  defstruct [:file_data, :file_id, :filename, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      file_data: {:string, :generic},
      file_id: {:union, [{:string, :generic}, :null]},
      filename: {:string, :generic},
      type: {:const, "input_file"}
    ]
  end
end
