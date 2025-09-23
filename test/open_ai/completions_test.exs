defmodule OpenAi.CompletionsTest do
  use ExUnit.Case
  import Mox

  alias OpenAi.Completions
  alias OpenAi.Completion
  alias OpenAi.Chat

  describe "create_completion/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post

        assert %{
                 "best_of" => 1,
                 "echo" => false,
                 "frequency_penalty" => +0.0,
                 "max_tokens" => 60,
                 "model" => "text-davinci-003",
                 "n" => 1,
                 "presence_penalty" => +0.0,
                 "prompt" => "prompt",
                 "seed" => 123,
                 "stop" => ["stop"],
                 "stream" => true,
                 "suffix" => "suffix",
                 "temperature" => 0.5,
                 "top_p" => 1.0,
                 "user" => "user"
               } = Poison.decode!(request.body)

        assert request.url == "https://api.openai.com/v1/completions"

        {:ok, OpenAi.Mocks.Completion.create()}
      end)

      {:ok, completion} =
        %Completion.CreateRequest{
          best_of: 1,
          echo: false,
          frequency_penalty: 0.0,
          logit_bias: nil,
          logprobs: 0,
          max_tokens: 60,
          model: "text-davinci-003",
          n: 1,
          presence_penalty: 0.0,
          prompt: "prompt",
          seed: 123,
          stop: ["stop"],
          stream: true,
          stream_options: %Chat.Completion.Stream.Options{
            include_usage: false
          },
          suffix: "suffix",
          temperature: 0.5,
          top_p: 1.0,
          user: "user"
        }
        |> Completions.create_completion()

      assert %Completion.CreateResponse{
               choices: [
                 %{
                   finish_reason: "length",
                   index: 0,
                   logprobs: %Completion.CreateResponse.Choice.Logprobs{},
                   text: "response"
                 },
                 %{
                   finish_reason: "length",
                   index: 0,
                   logprobs: %Completion.CreateResponse.Choice.Logprobs{},
                   text: "response"
                 }
               ],
               model: "text-davinci-003",
               object: "text_completion"
             } = completion
    end
  end
end
