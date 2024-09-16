defmodule OpenAi.Client.Stream.Error do
  @moduledoc """
  Provides struct and type for a Client.Stream.Error
  """
  @type t :: %__MODULE__{
          data: any() | nil,
          message: String.t() | nil
        }

  defstruct [:data, :message]
end
