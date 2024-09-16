defmodule OpenAi.Mocks.Moderation do
  @moduledoc """
  Mocks for moderation related responses.
  """
  def moderation(data) do
    %{
      id: "modr-XXXXX",
      model: "text-moderation-005"
    }
    |> Map.merge(data)
    |> Map.merge(%{
      results: data |> Map.get(:results, []) |> Enum.map(&moderation_result(&1))
    })
  end

  def moderation_result(data) do
    %{
      flagged: true
    }
    |> Map.merge(data)
    |> Map.merge(%{
      categories: data |> Map.get(:categories, %{}) |> moderation_result_categories(),
      category_scores:
        data |> Map.get("category_scores", %{}) |> moderation_result_category_scores()
    })
  end

  def moderation_result_categories(data) do
    %{
      sexual: false,
      hate: false,
      harassment: false,
      "self-harm": false,
      "sexual/minors": false,
      "hate/threatening": false,
      "violence/graphic": false,
      "self-harm/intent": false,
      "self-harm/instructions": false,
      "harassment/threatening": true,
      violence: true
    }
    |> Map.merge(data)
  end

  def moderation_result_category_scores(data) do
    %{
      sexual: 1.2282071e-06,
      hate: 0.010696256,
      harassment: 0.29842457,
      "self-harm": 1.5236925e-08,
      "sexual/minors": 5.7246268e-08,
      "hate/threatening": 0.0060676364,
      "violence/graphic": 4.435014e-06,
      "self-harm/intent": 8.098441e-10,
      "self-harm/instructions": 2.8498655e-11,
      "harassment/threatening": 0.63055265,
      violence: 0.99011886
    }
    |> Map.merge(data)
  end

  def create_moderation(data \\ %{results: [%{}]}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> moderation()
        |> Poison.encode!()
    }
  end
end
