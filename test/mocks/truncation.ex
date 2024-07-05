defmodule Mocks.Truncation do
  def object(data) do
    %{
      last_messages: 10,
      type: "auto"
    }
    |> Map.merge(data)
  end
end
