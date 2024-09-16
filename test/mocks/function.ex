defmodule OpenAi.Mocks.Function do
  @moduledoc """
  Mocks for function related responses.
  """
  def object(data) do
    %{
      name: "Function name",
      description: "Function description",
      parameters: %{
        "key" => "value"
      }
    }
    |> Map.merge(data)
  end
end
