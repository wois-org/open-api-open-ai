defmodule OpenAi.ResponsesTest do
  use ExUnit.Case
  import Mox

  alias OpenAi.Responses
  alias OpenAi.Response

  describe "create_response/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post

        assert %{
                 "input" => "Hi, how are you doing",
                 "instructions" => "Be a friendly chatbot",
                 "model" => "gpt-4o-mini",
                 "stream" => false
               } = Poison.decode!(request.body)

        assert request.url == "https://api.openai.com/v1/responses"

        {:ok, OpenAi.Mocks.Responses.create_response()}
      end)

      assert {:ok, response} =
               %Response.Create{
                 stream: false,
                 instructions: "Be a friendly chatbot",
                 model: "gpt-4o-mini",
                 input: "Hi, how are you doing"
               }
               |> Responses.create_response()

      assert %OpenAi.Response{
               created_at: 1_764_246_539,
               error: nil,
               id: "resp_XXXX",
               incomplete_details: nil,
               instructions: "Be a friendly chatbot",
               max_output_tokens: nil,
               metadata: %{"key" => "value"},
               model: "gpt-4o-mini-2024-07-18",
               object: "response",
               output: [
                 %OpenAi.Response.Output.Message{
                   content: [
                     %OpenAi.Response.Output.TextContent{
                       annotations: [],
                       text: "Hi there!",
                       type: "output_text"
                     }
                   ],
                   id: "msg_XXXX",
                   role: "assistant",
                   status: "completed",
                   type: "message"
                 }
               ],
               output_text: nil,
               parallel_tool_calls: true,
               previous_response_id: nil,
               reasoning: %OpenAi.Response.Reasoning{
                 effort: nil,
                 generate_summary: nil,
                 summary: nil
               },
               service_tier: "default",
               status: "completed",
               temperature: 1.0,
               text: %{"format" => %{"type" => "text"}, "verbosity" => "medium"},
               tool_choice: "auto",
               tools: [],
               top_p: 1.0,
               truncation: "disabled",
               usage: %OpenAi.Response.Usage{
                 input_tokens: 20,
                 input_tokens_details: %OpenAi.Response.Usage.InputTokensDetails{
                   cached_tokens: 0
                 },
                 output_tokens: 16,
                 output_tokens_details: %OpenAi.Response.Usage.OutputTokensDetails{
                   reasoning_tokens: 0
                 },
                 total_tokens: 36
               },
               user: nil
             } = response
    end
  end

  test "with web search tool response" do
    expect(HTTPoisonMock, :request, fn request ->
      assert request.method == :post
      assert request.url == "https://api.openai.com/v1/responses"

      {:ok,
       OpenAi.Mocks.Responses.create_response(%{
         "tools" => [
           %{
             "search_context_size" => "medium",
             "type" => "web_search_preview",
             "user_location" => %{
               "country" => "US",
               "type" => "approximate"
             }
           }
         ]
       })}
    end)

    assert {:ok,
            %OpenAi.Response{
              tools: [
                %OpenAi.Response.WebSearch.PreviewTool{
                  search_context_size: "medium",
                  type: "web_search_preview",
                  user_location: %OpenAi.User.ApproximateLocation{
                    country: "US",
                    type: "approximate"
                  }
                }
              ]
            }} =
             %Response.Create{
               stream: false,
               instructions: "Tell me about this website",
               model: "gpt-4o-mini",
               input: "https://example.com"
             }
             |> Responses.create_response()
  end

  describe "delete_response/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :delete
        assert request.url == "https://api.openai.com/v1/responses/resp_XXXX"

        {:ok, OpenAi.Mocks.Responses.delete_response()}
      end)

      # TODO improve this test when OpenAI will fix specs
      assert "resp_XXXX" |> Responses.delete_response() |> inspect() =~ "\"deleted\" => true"
    end
  end
end
