defmodule OpenAi.Mocks.Function do
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
