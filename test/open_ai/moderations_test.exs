defmodule OpenAi.ModerationsTest do
  use ExUnit.Case
  import Mox

  alias OpenAi.Moderations
  alias OpenAi.Moderation

  describe "create_moderation/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post

        assert %{
                 "input" => "This is a test",
                 "model" => "text-moderation-latest"
               } = Poison.decode!(request.body)

        assert request.url ==
                 "https://api.openai.com/v1/moderations"

        {:ok, OpenAi.Mocks.Moderation.create_moderation()}
      end)

      {:ok, response} =
        %Moderation.CreateRequest{
          input: "This is a test",
          model: "text-moderation-latest"
        }
        |> Moderations.create_moderation()

      assert %OpenAi.Moderation.CreateResponse{
               id: "modr-XXXXX",
               model: "text-moderation-005",
               results: [
                 %OpenAi.Moderation.CreateResponse.Result{
                   categories: %OpenAi.Moderation.CreateResponse.Result.Categories{
                     harassment: false,
                     "harassment/threatening": true,
                     hate: false,
                     "hate/threatening": false,
                     "self-harm": false,
                     "self-harm/instructions": false,
                     "self-harm/intent": false,
                     sexual: false,
                     "sexual/minors": false,
                     violence: true,
                     "violence/graphic": false
                   },
                   category_scores: %OpenAi.Moderation.CreateResponse.Result.CategoryScores{
                     harassment: 0.29842457,
                     "harassment/threatening": 0.63055265,
                     hate: 0.010696256,
                     "hate/threatening": 0.0060676364,
                     "self-harm": 1.5236925e-8,
                     "self-harm/instructions": 2.8498655e-11,
                     "self-harm/intent": 8.098441e-10,
                     sexual: 1.2282071e-6,
                     "sexual/minors": 5.7246268e-8,
                     violence: 0.99011886,
                     "violence/graphic": 4.435014e-6
                   },
                   flagged: true
                 }
               ]
             } = response
    end
  end
end
