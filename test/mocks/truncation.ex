defmodule OpenAi.Mocks.Truncation do
  @moduledoc """
  Mocks for truncation related responses.
  """
  def object(data) do
    %{
      last_messages: 10,
      type: "auto"
    }
    |> Map.merge(data)
  end
end
