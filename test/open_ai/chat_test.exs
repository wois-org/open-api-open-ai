defmodule OpenAi.ChatTest do
  use ExUnit.Case
  import Mox

  alias OpenAi.Chat

  describe "create_chat_completion/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post

        assert %{
                 "frequency_penalty" => +0.0,
                 "function_call" => %{"name" => "name"},
                 "functions" => [
                   %{
                     "name" => "name",
                     "parameters" => %{"key" => "value"}
                   }
                 ],
                 "logprobs" => 0,
                 "max_tokens" => 60,
                 "messages" => [
                   %{
                     "content" => "assistant_content",
                     "function_call" => %{
                       "arguments" => "arguments",
                       "name" => "assistant_function_name"
                     },
                     "name" => "assistant_name",
                     "role" => "assistant"
                   },
                   %{
                     "content" => "function_content",
                     "name" => "function_name",
                     "role" => "function"
                   },
                   %{
                     "content" => "system_content",
                     "name" => "system_name",
                     "role" => "system"
                   },
                   %{
                     "content" => "tool_content",
                     "role" => "tool",
                     "tool_call_id" => "tc_abc123"
                   },
                   %{"content" => "user_content", "name" => "user_name", "role" => "user"}
                 ],
                 "model" => "text-davinci-003",
                 "n" => 1,
                 "parallel_tool_calls" => false,
                 "presence_penalty" => +0.0,
                 "response_format" => %{"type" => "json_object"},
                 "seed" => 123,
                 "stream" => false,
                 "stream_options" => %{"include_usage" => false},
                 "temperature" => 0.5,
                 "tool_choice" => %{"function" => %{"name" => "function_name"}},
                 "tools" => [
                   %{
                     "function" => %{
                       "name" => "function_name",
                       "parameters" => %{"key" => "value"}
                     },
                     "type" => "function"
                   }
                 ],
                 "top_logprobs" => 0,
                 "top_p" => 1.0,
                 "user" => "user"
               } = request.body |> Poison.decode!()

        assert request.url == "https://api.openai.com/v1/chat/completions"

        {:ok, OpenAi.Mocks.ChatCompletion.create()}
      end)

      {:ok, completion} =
        %Chat.Completion.CreateRequest{
          frequency_penalty: 0.0,
          function_call: %Chat.Completion.FunctionCallOption{
            name: "name"
          },
          functions: [
            %Chat.Completion.Function{
              name: "name",
              parameters: %{
                "key" => "value"
              }
            }
          ],
          logit_bias: nil,
          logprobs: 0,
          max_tokens: 60,
          messages: [
            %Chat.Completion.Request.AssistantMessage{
              content: "assistant_content",
              function_call: %Chat.Completion.Request.AssistantMessageFunctionCall{
                name: "assistant_function_name",
                arguments: "arguments"
              },
              role: "assistant",
              name: "assistant_name"
            },
            %Chat.Completion.Request.FunctionMessage{
              content: "function_content",
              role: "function",
              name: "function_name"
            },
            %Chat.Completion.Request.SystemMessage{
              content: "system_content",
              role: "system",
              name: "system_name"
            },
            %Chat.Completion.Request.ToolMessage{
              content: "tool_content",
              role: "tool",
              tool_call_id: "tc_abc123"
            },
            %Chat.Completion.Request.UserMessage{
              role: "user",
              content: "user_content",
              name: "user_name"
            }
          ],
          model: "text-davinci-003",
          n: 1,
          parallel_tool_calls: false,
          presence_penalty: 0.0,
          response_format: %Chat.Completion.Request.CreateResponseFormat{
            type: "json_object"
          },
          seed: 123,
          stream: false,
          stream_options: %Chat.Completion.StreamOptions{
            include_usage: false
          },
          temperature: 0.5,
          tool_choice: %Chat.Completion.NamedTool.Choice{
            function: %Chat.Completion.NamedTool.ChoiceFunction{
              name: "function_name"
            }
          },
          tools: [
            %Chat.Completion.Tool{
              function: %OpenAi.Function{
                name: "function_name",
                parameters: %{
                  "key" => "value"
                }
              },
              type: "function"
            }
          ],
          top_logprobs: 0,
          top_p: 1.0,
          user: "user"
        }
        |> Chat.create_chat_completion()

      assert %OpenAi.Chat.Completion.CreateResponse{
               choices: [
                 %OpenAi.Chat.Completion.CreateResponse.Choice{
                   finish_reason: "stop",
                   index: 0,
                   logprobs: %OpenAi.Chat.Completion.CreateResponse.Choice.Logprobs{
                     content: [
                       %OpenAi.Chat.Completion.TokenLogprob{
                         bytes: [0, 1, 2],
                         logprob: 0.1,
                         token: "token_1",
                         top_logprobs: [
                           %OpenAi.Chat.Completion.TokenLogprobTopLogprobs{
                             bytes: [1, 2, 3],
                             logprob: 0.1,
                             token: "token_1"
                           }
                         ]
                       },
                       %OpenAi.Chat.Completion.TokenLogprob{
                         bytes: [0, 1, 2],
                         logprob: 0.1,
                         token: "token_2",
                         top_logprobs: [
                           %OpenAi.Chat.Completion.TokenLogprobTopLogprobs{
                             bytes: [1, 2, 3],
                             logprob: 0.1,
                             token: "token_2"
                           }
                         ]
                       }
                     ]
                   },
                   message: %OpenAi.Chat.Completion.Response.Message{
                     content: "choice message content",
                     function_call: %OpenAi.Chat.Completion.Response.MessageFunctionCall{
                       arguments: "m_function_arguments",
                       name: "m_function_name"
                     },
                     role: "assistant",
                     tool_calls: [
                       %OpenAi.Chat.Completion.MessageTool.Call{
                         function: %OpenAi.Chat.Completion.MessageTool.CallFunction{
                           arguments: "tc_function_arguments",
                           name: "tc_function_name"
                         },
                         id: "tc_abc123",
                         type: "function"
                       }
                     ]
                   }
                 },
                 %OpenAi.Chat.Completion.CreateResponse.Choice{
                   finish_reason: "stop",
                   index: 0,
                   logprobs: %OpenAi.Chat.Completion.CreateResponse.Choice.Logprobs{
                     content: [
                       %OpenAi.Chat.Completion.TokenLogprob{
                         bytes: [0, 1, 2],
                         logprob: 0.1,
                         token: "token_1",
                         top_logprobs: [
                           %OpenAi.Chat.Completion.TokenLogprobTopLogprobs{
                             bytes: [1, 2, 3],
                             logprob: 0.1,
                             token: "token_1"
                           }
                         ]
                       },
                       %OpenAi.Chat.Completion.TokenLogprob{
                         bytes: [0, 1, 2],
                         logprob: 0.1,
                         token: "token_2",
                         top_logprobs: [
                           %OpenAi.Chat.Completion.TokenLogprobTopLogprobs{
                             bytes: [1, 2, 3],
                             logprob: 0.1,
                             token: "token_2"
                           }
                         ]
                       }
                     ]
                   },
                   message: %OpenAi.Chat.Completion.Response.Message{
                     content: "choice message content",
                     function_call: %OpenAi.Chat.Completion.Response.MessageFunctionCall{
                       arguments: "m_function_arguments",
                       name: "m_function_name"
                     },
                     role: "assistant",
                     tool_calls: [
                       %OpenAi.Chat.Completion.MessageTool.Call{
                         function: %OpenAi.Chat.Completion.MessageTool.CallFunction{
                           arguments: "tc_function_arguments",
                           name: "tc_function_name"
                         },
                         id: "tc_abc123",
                         type: "function"
                       }
                     ]
                   }
                 }
               ],
               created: 123,
               id: "c_abc123",
               model: "text-davinci-003",
               object: "chat.completion",
               service_tier: "default",
               system_fingerprint: "fingerprint",
               usage: %OpenAi.Completion.Usage{
                 completion_tokens: 232,
                 prompt_tokens: 123,
                 total_tokens: 456
               }
             } = completion
    end
  end
end
