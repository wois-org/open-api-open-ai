defmodule AssistantsTest do
  use ExUnit.Case
  import Mox

  alias OpenAi.Assistants
  alias OpenAi.Assistant
  alias OpenAi.Message
  alias OpenAi.Run
  alias OpenAi.Function
  alias OpenAi.Truncation
  alias OpenAi.Thread

  describe "cancel_run/2" do
    test "correct paramters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/threads/a-abc123/runs/r-abc123/cancel"

        {:ok, Mocks.Assistant.cancel_run()}
      end)

      {:ok, response} = Assistants.cancel_run("a-abc123", "r-abc123")

      assert %Run{
               assistant_id: "a_abcd1234",
               cancelled_at: 123_456,
               completed_at: 123_456,
               created_at: 123_456,
               expires_at: 123_456,
               failed_at: 123_456,
               id: "r_abcd1234",
               incomplete_details: %Run.IncompleteDetails{reason: "max_completion_tokens"},
               instructions: "instructions",
               last_error: %Run.LastError{code: "server_error", message: "error_message"},
               max_completion_tokens: 1000,
               max_prompt_tokens: 1000,
               metadata: %{"key" => "value"},
               model: "text-embedding-ada-002",
               object: "thread.run",
               parallel_tool_calls: true,
               required_action: %Run.RequiredAction{
                 submit_tool_outputs: %Run.RequiredAction.SubmitToolOutputs{
                   tool_calls: [
                     %Run.ToolCall{
                       function: %Run.ToolCall.Function{
                         arguments: "arguments",
                         name: "tool_call_function"
                       },
                       id: "tc_abcd1234",
                       type: "function"
                     }
                   ]
                 },
                 type: "submit_tool_outputs"
               },
               response_format: %Assistant.ApiResponseFormat{type: "text"},
               started_at: 123_456,
               status: "completed",
               temperature: 0.5,
               thread_id: "t_abcd1234",
               tool_choice: %Assistant.NamedToolChoice{
                 function: %Assistant.NamedToolChoiceFunction{name: "tool_choice_function"},
                 type: "function"
               },
               tools: [
                 %Assistant.Tool.File.Search{
                   type: "file_search",
                   file_search: %Assistant.Tool.File.SearchFileSearch{max_num_results: 10}
                 },
                 %Assistant.Tool.Function{
                   function: %OpenAi.Function{
                     description: "Function description",
                     name: "Function name",
                     parameters: %{"key" => "value"}
                   },
                   type: "function"
                 },
                 %Assistant.Tool.Code{type: "code_interpreter"}
               ],
               top_p: 123,
               truncation_strategy: %OpenAi.Truncation{last_messages: 10, type: "auto"},
               usage: %Run.CompletionUsage{
                 completion_tokens: nil,
                 prompt_tokens: 1000,
                 total_tokens: 1000
               }
             } = response
    end
  end

  describe "create_assistant/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/assistants"

        assert %{
                 "description" => "description",
                 "instructions" => "instructions",
                 "metadata" => %{"key" => "value"},
                 "model" => "gpt-4",
                 "name" => "name",
                 "response_format" => %{"type" => "json_object"},
                 "temperature" => 0.5,
                 "tool_resources" => %{
                   "code_interpreter" => %{"file_ids" => ["file_id", "file_id"]},
                   "file_search" => %{"key" => "value"}
                 },
                 "tools" => [%{"type" => "code_interpreter"}],
                 "top_p" => 123
               } = request.body |> Poison.decode!()

        {:ok, Mocks.Assistant.create()}
      end)

      {:ok, assistant} =
        %Assistant.CreateRequest{
          description: "description",
          instructions: "instructions",
          metadata: %{"key" => "value"},
          model: "gpt-4",
          name: "name",
          response_format: %Assistant.ApiResponseFormat{type: "json_object"},
          temperature: 0.5,
          tool_resources: %Assistant.CreateRequest.ToolResources{
            code_interpreter: %Assistant.CreateRequest.ToolResources.CodeInterpreter{
              file_ids: ["file_id", "file_id"]
            },
            file_search: %{
              "key" => "value"
            }
          },
          tools: [
            %Assistant.Tool.Code{
              type: "code_interpreter"
            }
          ],
          top_p: 123
        }
        |> Assistants.create_assistant()

      assert %Assistant{
               created_at: 123,
               description: "Assistant description",
               id: "a_abc1234",
               instructions: "Assistant instructions",
               metadata: %{"key" => "value"},
               model: "gpt-4",
               name: "Assistant name",
               object: "assistant",
               response_format: %Assistant.ApiResponseFormat{type: "text"},
               temperature: 0.5,
               tool_resources: %Assistant.Tool.Resources{
                 code_interpreter: %Assistant.Tool.Resources.CodeInterpreter{
                   file_ids: ["file_id", "file_id"]
                 },
                 file_search: %Assistant.Tool.Resources.FileSearch{
                   vector_store_ids: ["vs_abc123", "vs_abc124"]
                 }
               },
               tools: [
                 %Assistant.Tool.File.Search{
                   file_search: %Assistant.Tool.File.SearchFileSearch{
                     max_num_results: 10
                   },
                   type: "file_search"
                 },
                 %Assistant.Tool.Function{
                   function: %OpenAi.Function{
                     description: "Function description",
                     name: "Function name",
                     parameters: %{"key" => "value"}
                   },
                   type: "function"
                 },
                 %Assistant.Tool.Code{type: "code_interpreter"}
               ],
               top_p: 123
             } = assistant
    end
  end

  describe "create_message/2" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/threads/a-abc123/messages"

        assert %{
                 "content" => "content",
                 "metadata" => %{"key" => "value"},
                 "role" => "user"
               } = request.body |> Poison.decode!()

        {:ok, Mocks.Assistant.message_create()}
      end)

      {:ok, message} =
        Assistants.create_message("a-abc123", %Message.CreateRequest{
          attachments: [
            %Message.Attachment{
              file_id: "f_abc1234",
              tools: [
                %Assistant.Tool.Code{
                  type: "code_interpreter"
                },
                %Assistant.Tool.File.SearchTypeOnly{
                  type: "file_search"
                }
              ]
            }
          ],
          content: "content",
          metadata: %{"key" => "value"},
          role: "user"
        })

      assert %Message{
               content: [
                 %{type: "image_file", image_file: %{file_id: "f_1234", detail: "auto"}},
                 %{
                   type: "image_url",
                   image_url: %{url: "https://example.com/image.jpg", detail: "auto"}
                 },
                 %{type: "text", text: %{}}
               ],
               created_at: 123,
               id: "m_abc1234",
               metadata: %{"key" => "value"},
               object: "thread.message",
               role: "user",
               thread_id: "t_abc1234"
             } = message
    end
  end

  describe "create_run/2" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/threads/a-abc123/runs"

        assert %{
                 "assistant_id" => "a-abc123",
                 "metadata" => %{"key" => "value"},
                 "model" => "gpt-4",
                 "temperature" => 0.5,
                 "top_p" => 123,
                 "additional_instructions" => "additional_instructions",
                 "additional_messages" => [
                   %{
                     "attachments" => [
                       %{
                         "file_id" => "f_abc1234",
                         "tools" => [%{"type" => "code_interpreter"}, %{"type" => "file_search"}]
                       }
                     ],
                     "content" => "content",
                     "metadata" => %{"key" => "value"},
                     "role" => "user"
                   }
                 ],
                 "instructions" => "instructions",
                 "max_completion_tokens" => 1000,
                 "max_prompt_tokens" => 1000,
                 "parallel_tool_calls" => true,
                 "response_format" => %{"type" => "text"},
                 "stream" => true,
                 "tool_choice" => %{
                   "function" => %{"name" => "tool_choice_function"},
                   "type" => "function"
                 },
                 "tools" => [
                   %{"file_search" => %{"max_num_results" => 10}, "type" => "file_search"},
                   %{
                     "function" => %{
                       "description" => "Function description",
                       "name" => "Function name",
                       "parameters" => %{"key" => "value"}
                     },
                     "type" => "function"
                   },
                   %{"type" => "code_interpreter"}
                 ],
                 "truncation_strategy" => %{"last_messages" => 10, "type" => "auto"}
               } = request.body |> Poison.decode!()

        {:ok, Mocks.Assistant.run_create()}
      end)

      {:ok, run} =
        Assistants.create_run("a-abc123", %Run.CreateRequest{
          additional_instructions: "additional_instructions",
          additional_messages: [
            %Message.CreateRequest{
              attachments: [
                %Message.Attachment{
                  file_id: "f_abc1234",
                  tools: [
                    %Assistant.Tool.Code{
                      type: "code_interpreter"
                    },
                    %Assistant.Tool.File.SearchTypeOnly{
                      type: "file_search"
                    }
                  ]
                }
              ],
              content: "content",
              metadata: %{"key" => "value"},
              role: "user"
            }
          ],
          assistant_id: "a-abc123",
          instructions: "instructions",
          max_completion_tokens: 1000,
          max_prompt_tokens: 1000,
          metadata: %{"key" => "value"},
          model: "gpt-4",
          parallel_tool_calls: true,
          response_format: %Assistant.ApiResponseFormat{type: "text"},
          stream: true,
          temperature: 0.5,
          tool_choice: %Assistant.NamedToolChoice{
            function: %Assistant.NamedToolChoiceFunction{name: "tool_choice_function"},
            type: "function"
          },
          tools: [
            %Assistant.Tool.File.Search{
              type: "file_search",
              file_search: %Assistant.Tool.File.SearchFileSearch{max_num_results: 10}
            },
            %Assistant.Tool.Function{
              function: %OpenAi.Function{
                description: "Function description",
                name: "Function name",
                parameters: %{"key" => "value"}
              },
              type: "function"
            },
            %Assistant.Tool.Code{type: "code_interpreter"}
          ],
          top_p: 123,
          truncation_strategy: %OpenAi.Truncation{last_messages: 10, type: "auto"}
        })

      assert %Run{
               assistant_id: "a_abcd1234",
               cancelled_at: 123_456,
               completed_at: 123_456,
               created_at: 123_456,
               expires_at: 123_456,
               failed_at: 123_456,
               id: "r_abcd1234",
               incomplete_details: %Run.IncompleteDetails{reason: "max_completion_tokens"},
               instructions: "instructions",
               last_error: %Run.LastError{code: "server_error", message: "error_message"},
               max_completion_tokens: 1000,
               max_prompt_tokens: 1000,
               metadata: %{"key" => "value"},
               model: "text-embedding-ada-002",
               object: "thread.run",
               parallel_tool_calls: true,
               required_action: %Run.RequiredAction{
                 submit_tool_outputs: %Run.RequiredAction.SubmitToolOutputs{
                   tool_calls: [
                     %Run.ToolCall{
                       function: %Run.ToolCall.Function{
                         arguments: "arguments",
                         name: "tool_call_function"
                       },
                       id: "tc_abcd1234",
                       type: "function"
                     }
                   ]
                 },
                 type: "submit_tool_outputs"
               },
               response_format: %Assistant.ApiResponseFormat{type: "text"},
               started_at: 123_456,
               status: "completed",
               temperature: 0.5,
               thread_id: "t_abcd1234",
               tool_choice: %Assistant.NamedToolChoice{
                 function: %Assistant.NamedToolChoiceFunction{name: "tool_choice_function"},
                 type: "function"
               },
               tools: [
                 %Assistant.Tool.File.Search{
                   type: "file_search",
                   file_search: %Assistant.Tool.File.SearchFileSearch{max_num_results: 10}
                 },
                 %Assistant.Tool.Function{
                   function: %Function{
                     description: "Function description",
                     name: "Function name",
                     parameters: %{"key" => "value"}
                   },
                   type: "function"
                 },
                 %Assistant.Tool.Code{type: "code_interpreter"}
               ],
               top_p: 123,
               truncation_strategy: %Truncation{last_messages: 10, type: "auto"},
               usage: %Run.CompletionUsage{
                 completion_tokens: nil,
                 prompt_tokens: 1000,
                 total_tokens: 1000
               }
             } = run
    end
  end

  describe "create_thread/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/threads"

        assert %{
                 "assistant_id" => "a-abc123",
                 "metadata" => %{"key" => "value"},
                 "model" => "gpt-4",
                 "temperature" => 0.5,
                 "top_p" => 123,
                 "additional_instructions" => "additional_instructions",
                 "additional_messages" => [
                   %{
                     "attachments" => [
                       %{
                         "file_id" => "f_abc1234",
                         "tools" => [%{"type" => "code_interpreter"}, %{"type" => "file_search"}]
                       }
                     ],
                     "content" => "content",
                     "metadata" => %{"key" => "value"},
                     "role" => "user"
                   }
                 ],
                 "instructions" => "instructions",
                 "max_completion_tokens" => 1000,
                 "max_prompt_tokens" => 1000,
                 "parallel_tool_calls" => true,
                 "response_format" => %{"type" => "text"},
                 "stream" => true,
                 "tool_choice" => %{
                   "function" => %{"name" => "tool_choice_function"},
                   "type" => "function"
                 },
                 "tools" => [
                   %{"file_search" => %{"max_num_results" => 10}, "type" => "file_search"},
                   %{
                     "function" => %{
                       "description" => "Function description",
                       "name" => "Function name",
                       "parameters" => %{"key" => "value"}
                     },
                     "type" => "function"
                   },
                   %{"type" => "code_interpreter"}
                 ],
                 "truncation_strategy" => %{"last_messages" => 10, "type" => "auto"}
               } = request.body |> Poison.decode!()

        {:ok, Mocks.Assistant.thread_create()}
      end)

      {:ok, thread} =
        Assistants.create_thread(%Run.CreateRequest{
          additional_instructions: "additional_instructions",
          additional_messages: [
            %Message.CreateRequest{
              attachments: [
                %Message.Attachment{
                  file_id: "f_abc1234",
                  tools: [
                    %Assistant.Tool.Code{
                      type: "code_interpreter"
                    },
                    %Assistant.Tool.File.SearchTypeOnly{
                      type: "file_search"
                    }
                  ]
                }
              ],
              content: "content",
              metadata: %{"key" => "value"},
              role: "user"
            }
          ],
          assistant_id: "a-abc123",
          instructions: "instructions",
          max_completion_tokens: 1000,
          max_prompt_tokens: 1000,
          metadata: %{"key" => "value"},
          model: "gpt-4",
          parallel_tool_calls: true,
          response_format: %Assistant.ApiResponseFormat{type: "text"},
          stream: true,
          temperature: 0.5,
          tool_choice: %Assistant.NamedToolChoice{
            function: %Assistant.NamedToolChoiceFunction{name: "tool_choice_function"},
            type: "function"
          },
          tools: [
            %Assistant.Tool.File.Search{
              type: "file_search",
              file_search: %Assistant.Tool.File.SearchFileSearch{max_num_results: 10}
            },
            %Assistant.Tool.Function{
              function: %OpenAi.Function{
                description: "Function description",
                name: "Function name",
                parameters: %{"key" => "value"}
              },
              type: "function"
            },
            %Assistant.Tool.Code{type: "code_interpreter"}
          ],
          top_p: 123,
          truncation_strategy: %OpenAi.Truncation{last_messages: 10, type: "auto"}
        })

      assert %Thread{
               created_at: 1_699_061_776,
               id: "th_abc123",
               metadata: %{"key" => "value"},
               object: "thread",
               tool_resources: %OpenAi.Thread.ToolResources{
                 code_interpreter: %OpenAi.Thread.ToolResources.CodeInterpreter{
                   file_ids: ["file_id", "file_id"]
                 },
                 file_search: %OpenAi.Thread.ToolResources.FileSearch{
                   vector_store_ids: ["vs_abc123", "vs_abc124"]
                 }
               }
             } = thread
    end
  end

  describe "create_thread_and_run/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/threads/runs"

        assert %{
                 "assistant_id" => "a-abc123",
                 "metadata" => %{"key" => "value"},
                 "model" => "gpt-4",
                 "temperature" => 0.5,
                 "top_p" => 123,
                 "instructions" => "instructions",
                 "max_completion_tokens" => 1000,
                 "max_prompt_tokens" => 1000,
                 "parallel_tool_calls" => true,
                 "response_format" => %{"type" => "text"},
                 "stream" => true,
                 "tool_choice" => %{
                   "function" => %{"name" => "tool_choice_function"},
                   "type" => "function"
                 },
                 "tools" => [
                   %{"file_search" => %{"max_num_results" => 10}, "type" => "file_search"},
                   %{
                     "function" => %{
                       "description" => "Function description",
                       "name" => "Function name",
                       "parameters" => %{"key" => "value"}
                     },
                     "type" => "function"
                   },
                   %{"type" => "code_interpreter"}
                 ],
                 "truncation_strategy" => %{"last_messages" => 10, "type" => "auto"}
               } = request.body |> Poison.decode!()

        {:ok, Mocks.Assistant.thread_create_and_run()}
      end)

      {:ok, thread} =
        %Thread.CreateAndRunRequest{
          assistant_id: "a-abc123",
          instructions: "instructions",
          max_completion_tokens: 1000,
          max_prompt_tokens: 1000,
          metadata: %{"key" => "value"},
          model: "gpt-4",
          parallel_tool_calls: true,
          response_format: %Assistant.ApiResponseFormat{type: "text"},
          stream: true,
          temperature: 0.5,
          tool_choice: %Assistant.NamedToolChoice{
            function: %Assistant.NamedToolChoiceFunction{name: "tool_choice_function"},
            type: "function"
          },
          tool_resources: %Assistant.CreateRequest.ToolResources{
            code_interpreter: %Assistant.CreateRequest.ToolResources.CodeInterpreter{
              file_ids: ["file_id", "file_id"]
            },
            file_search: %{
              "key" => "value"
            }
          },
          tools: [
            %Assistant.Tool.File.Search{
              type: "file_search",
              file_search: %Assistant.Tool.File.SearchFileSearch{max_num_results: 10}
            },
            %Assistant.Tool.Function{
              function: %OpenAi.Function{
                description: "Function description",
                name: "Function name",
                parameters: %{"key" => "value"}
              },
              type: "function"
            },
            %Assistant.Tool.Code{type: "code_interpreter"}
          ],
          top_p: 123,
          truncation_strategy: %OpenAi.Truncation{last_messages: 10, type: "auto"}
        }
        |> Assistants.create_thread_and_run()

      assert %Run{} = thread
    end
  end

  describe "delete_assistant/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :delete
        assert request.url == "https://api.openai.com/v1/assistants/a-abc123"

        {:ok, Mocks.Assistant.delete()}
      end)

      {:ok, assistant} = Assistants.delete_assistant("a-abc123")

      assert %Assistant.DeleteResponse{
               id: "a_abc1234",
               object: "assistant.deleted",
               deleted: true
             } = assistant
    end
  end

  describe "delete_message/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :delete
        assert request.url == "https://api.openai.com/v1/threads/a-abc123/messages/m-abc123"

        {:ok, Mocks.Assistant.delete_message()}
      end)

      {:ok, message} = Assistants.delete_message("a-abc123", "m-abc123")

      assert %Message.DeleteResponse{
               id: "m_abc1234",
               object: "thread.message.deleted",
               deleted: true
             } = message
    end
  end

  describe "delete_thread/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :delete
        assert request.url == "https://api.openai.com/v1/threads/a-abc123"

        {:ok, Mocks.Assistant.delete_thread()}
      end)

      {:ok, thread} = Assistants.delete_thread("a-abc123")

      assert %Thread.DeleteResponse{
               id: "th_abc123",
               object: "thread.deleted",
               deleted: true
             } = thread
    end
  end

  describe "get_assistant/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/assistants/a-abc123"

        {:ok, Mocks.Assistant.get()}
      end)

      {:ok, assistant} = Assistants.get_assistant("a-abc123")

      assert %Assistant{
               created_at: 123,
               description: "Assistant description",
               id: "a_abc1234",
               instructions: "Assistant instructions",
               metadata: %{"key" => "value"},
               model: "gpt-4",
               name: "Assistant name",
               object: "assistant",
               response_format: %OpenAi.Assistant.ApiResponseFormat{type: "text"},
               temperature: 0.5,
               tool_resources: %OpenAi.Assistant.Tool.Resources{
                 code_interpreter: %OpenAi.Assistant.Tool.Resources.CodeInterpreter{
                   file_ids: ["file_id", "file_id"]
                 },
                 file_search: %OpenAi.Assistant.Tool.Resources.FileSearch{
                   vector_store_ids: ["vs_abc123", "vs_abc124"]
                 }
               },
               tools: [
                 %OpenAi.Assistant.Tool.File.Search{
                   file_search: %OpenAi.Assistant.Tool.File.SearchFileSearch{
                     max_num_results: 10
                   },
                   type: "file_search"
                 },
                 %OpenAi.Assistant.Tool.Function{
                   function: %OpenAi.Function{
                     description: "Function description",
                     name: "Function name",
                     parameters: %{"key" => "value"}
                   },
                   type: "function"
                 },
                 %OpenAi.Assistant.Tool.Code{type: "code_interpreter"}
               ],
               top_p: 123
             } = assistant
    end
  end

  describe "get_message/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/threads/a-abc123/messages/m-abc123"

        {:ok, Mocks.Assistant.get_message()}
      end)

      {:ok, message} = Assistants.get_message("a-abc123", "m-abc123")

      assert %Message{
               content: [
                 %{type: "image_file", image_file: %{file_id: "f_1234", detail: "auto"}},
                 %{
                   type: "image_url",
                   image_url: %{url: "https://example.com/image.jpg", detail: "auto"}
                 },
                 %{type: "text", text: %{}}
               ],
               created_at: 123,
               id: "m_abc1234",
               metadata: %{"key" => "value"},
               object: "thread.message",
               role: "user",
               thread_id: "t_abc1234"
             } = message
    end
  end

  describe "get_run/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/threads/a-abc123/runs/r-abc123"

        {:ok, Mocks.Assistant.get_run()}
      end)

      {:ok, run} = Assistants.get_run("a-abc123", "r-abc123")

      assert %Run{
               assistant_id: "a_abcd1234",
               cancelled_at: 123_456,
               completed_at: 123_456,
               created_at: 123_456,
               expires_at: 123_456,
               failed_at: 123_456,
               id: "r_abcd1234",
               incomplete_details: %OpenAi.Run.IncompleteDetails{
                 reason: "max_completion_tokens"
               },
               instructions: "instructions",
               last_error: %OpenAi.Run.LastError{
                 code: "server_error",
                 message: "error_message"
               },
               max_completion_tokens: 1000,
               max_prompt_tokens: 1000,
               metadata: %{"key" => "value"},
               model: "text-embedding-ada-002",
               object: "thread.run",
               parallel_tool_calls: true,
               required_action: %OpenAi.Run.RequiredAction{
                 submit_tool_outputs: %OpenAi.Run.RequiredAction.SubmitToolOutputs{
                   tool_calls: [
                     %OpenAi.Run.ToolCall{
                       function: %OpenAi.Run.ToolCall.Function{
                         arguments: "arguments",
                         name: "tool_call_function"
                       },
                       id: "tc_abcd1234",
                       type: "function"
                     }
                   ]
                 },
                 type: "submit_tool_outputs"
               },
               response_format: %OpenAi.Assistant.ApiResponseFormat{type: "text"},
               started_at: 123_456,
               status: "completed",
               temperature: 0.5,
               thread_id: "t_abcd1234",
               tool_choice: %OpenAi.Assistant.NamedToolChoice{
                 function: %OpenAi.Assistant.NamedToolChoiceFunction{
                   name: "tool_choice_function"
                 },
                 type: "function"
               },
               tools: [
                 %OpenAi.Assistant.Tool.File.Search{
                   file_search: %OpenAi.Assistant.Tool.File.SearchFileSearch{
                     max_num_results: 10
                   },
                   type: "file_search"
                 },
                 %OpenAi.Assistant.Tool.Function{
                   function: %OpenAi.Function{
                     description: "Function description",
                     name: "Function name",
                     parameters: %{"key" => "value"}
                   },
                   type: "function"
                 },
                 %OpenAi.Assistant.Tool.Code{type: "code_interpreter"}
               ],
               top_p: 123,
               truncation_strategy: %OpenAi.Truncation{last_messages: 10, type: "auto"},
               usage: %OpenAi.Run.CompletionUsage{
                 completion_tokens: nil,
                 prompt_tokens: 1000,
                 total_tokens: 1000
               }
             } = run
    end
  end

  describe "get_run_step/3" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get

        assert request.url ==
                 "https://api.openai.com/v1/threads/a-abc123/runs/r-abc123/steps/s-abc123"

        {:ok, Mocks.Assistant.get_run_step()}
      end)

      {:ok, step} = Assistants.get_run_step("a-abc123", "r-abc123", "s-abc123")

      assert %Run.Step{
               assistant_id: "a_abcd1234",
               cancelled_at: 123_456,
               completed_at: 123_456,
               created_at: 123_456,
               expired_at: 123_456,
               failed_at: 123_456,
               id: "s_abcd1234",
               last_error: %Run.Step.LastError{
                 code: "server_error",
                 message: "error_message"
               },
               metadata: %{"key" => "value"},
               object: "thread.run.step",
               run_id: "r_abcd1234",
               status: "completed",
               step_details: %Run.Step.DetailsMessageCreation{
                 message_creation: %Run.Step.DetailsMessageCreationMessageCreation{
                   message_id: "m_abcd1234"
                 },
                 type: "message_creation"
               },
               thread_id: "t_abcd1234",
               type: "message_creation",
               usage: %Run.Step.CompletionUsage{
                 completion_tokens: nil,
                 prompt_tokens: 1000,
                 total_tokens: 1000
               }
             } = step
    end
  end

  describe "get_thread/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/threads/a-abc123"

        {:ok, Mocks.Assistant.get_thread()}
      end)

      {:ok, thread} = Assistants.get_thread("a-abc123")

      assert %Thread{
               created_at: 1_699_061_776,
               id: "th_abc123",
               metadata: %{"key" => "value"},
               object: "thread",
               tool_resources: %Thread.ToolResources{
                 code_interpreter: %Thread.ToolResources.CodeInterpreter{
                   file_ids: [
                     "file_id",
                     "file_id"
                   ]
                 },
                 file_search: %Thread.ToolResources.FileSearch{
                   vector_store_ids: [
                     "vs_abc123",
                     "vs_abc124"
                   ]
                 }
               }
             } = thread
    end
  end

  describe "list_assistants/0" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/assistants"

        {:ok,
         Mocks.Assistant.list([
           %{id: "a_abc1234", name: "Assistant 1"},
           %{id: "a_abc1235", name: "Assistant 2"}
         ])}
      end)

      {:ok, assistants} = Assistants.list_assistants()

      assert %Assistant.ListResponse{
               data: [
                 %Assistant{id: "a_abc1234", name: "Assistant 1"},
                 %Assistant{id: "a_abc1235", name: "Assistant 2"}
               ],
               object: "list",
               first_id: "a_abc1234",
               last_id: "a_abc1235",
               has_more: false
             } = assistants
    end
  end

  describe "list_messages/0" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/threads/th-abc123/messages"

        {:ok,
         Mocks.Assistant.list_messages([
           %{id: "m_abc1234", content: [%{text: %{value: "Message 1"}}]},
           %{id: "m_abc1235", content: [%{text: %{value: "Message 2"}}]}
         ])}
      end)

      {:ok, messages} = Assistants.list_messages("th-abc123")

      assert %Message.ListResponse{
               data: [
                 %Message{
                   id: "m_abc1234",
                   content: [
                     %OpenAi.Message.Content.Text{
                       text: %OpenAi.Message.Content.Text.Text{
                         annotations: [
                           %OpenAi.Message.Content.Text.AnnotationsFileCitation{
                             end_index: 123,
                             file_citation:
                               %OpenAi.Message.Content.Text.AnnotationsFileCitationFileCitation{
                                 file_id: "f_1234"
                               },
                             start_index: 123,
                             text: "content file citation",
                             type: "file_citation"
                           },
                           %OpenAi.Message.Content.Text.AnnotationsFilePath{
                             end_index: 123,
                             file_path: %OpenAi.Message.Content.Text.AnnotationsFilePathFilePath{
                               file_id: "f_1234"
                             },
                             start_index: 234,
                             text: "content file path",
                             type: "file_path"
                           }
                         ],
                         value: "Message 1"
                       },
                       type: "text"
                     }
                   ]
                 },
                 %Message{
                   id: "m_abc1235",
                   content: [
                     %OpenAi.Message.Content.Text{
                       text: %OpenAi.Message.Content.Text.Text{
                         annotations: _,
                         value: "Message 2"
                       },
                       type: "text"
                     }
                   ]
                 }
               ],
               object: "list",
               first_id: "m_abc1234",
               last_id: "m_abc1235",
               has_more: false
             } = messages
    end
  end

  describe "list_run_steps/2" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get

        assert request.url ==
                 "https://api.openai.com/v1/threads/th-abc123/runs/r-abc123/steps"

        {:ok, Mocks.Assistant.list_run_steps([%{id: "s_abcd1234"}, %{id: "s_abcd1235"}])}
      end)

      {:ok, steps} = Assistants.list_run_steps("th-abc123", "r-abc123")

      assert %Run.Step.ListResponse{
               data: [
                 %Run.Step{id: "s_abcd1234"},
                 %Run.Step{id: "s_abcd1235"}
               ],
               object: "list",
               first_id: "s_abcd1234",
               last_id: "s_abcd1235",
               has_more: false
             } = steps
    end
  end

  describe "list_runs/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/threads/th-abc123/runs"

        {:ok,
         Mocks.Assistant.list_runs([
           %{id: "r_abc1234", status: "completed"},
           %{id: "r_abc1235", status: "completed"}
         ])}
      end)

      {:ok, runs} = Assistants.list_runs("th-abc123")

      assert %Run.ListResponse{
               data: [
                 %Run{id: "r_abc1234", status: "completed"},
                 %Run{id: "r_abc1235", status: "completed"}
               ],
               object: "list",
               first_id: "r_abc1234",
               last_id: "r_abc1235",
               has_more: false
             } = runs
    end
  end

  describe "modify_assistant/2" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/assistants/a-abc123"

        assert %{
                 "description" => "description",
                 "instructions" => "instructions",
                 "metadata" => %{"key" => "value"},
                 "model" => "gpt-4",
                 "name" => "name",
                 "response_format" => %{
                   "type" => "json_object"
                 },
                 "temperature" => 0.5,
                 "tool_resources" => %{
                   "code_interpreter" => %{
                     "file_ids" => [
                       "file_id",
                       "file_id"
                     ]
                   },
                   "file_search" => %{
                     "vector_store_ids" => ["vs_abc123", "vs_abc124"]
                   }
                 },
                 "tools" => [
                   %{"type" => "code_interpreter"}
                 ],
                 "top_p" => 123
               } = request.body |> Poison.decode!()

        {:ok, Mocks.Assistant.update()}
      end)

      {:ok, assistant} =
        Assistants.modify_assistant("a-abc123", %Assistant.UpdateRequest{
          description: "description",
          instructions: "instructions",
          metadata: %{"key" => "value"},
          model: "gpt-4",
          name: "name",
          response_format: %Assistant.ApiResponseFormat{type: "json_object"},
          temperature: 0.5,
          tool_resources: %Assistant.UpdateRequest.ToolResources{
            code_interpreter: %Assistant.UpdateRequest.ToolResources.CodeInterpreter{
              file_ids: ["file_id", "file_id"]
            },
            file_search: %Assistant.UpdateRequest.ToolResources.FileSearch{
              vector_store_ids: ["vs_abc123", "vs_abc124"]
            }
          },
          tools: [
            %Assistant.Tool.Code{
              type: "code_interpreter"
            }
          ],
          top_p: 123
        })

      assert %Assistant{
               created_at: 123,
               description: "Assistant description",
               id: "a_abc1234",
               instructions: "Assistant instructions",
               metadata: %{"key" => "value"},
               model: "gpt-4",
               name: "Assistant name",
               object: "assistant",
               response_format: %Assistant.ApiResponseFormat{type: "text"},
               temperature: 0.5,
               tool_resources: %Assistant.Tool.Resources{
                 code_interpreter: %Assistant.Tool.Resources.CodeInterpreter{
                   file_ids: ["file_id", "file_id"]
                 },
                 file_search: %Assistant.Tool.Resources.FileSearch{
                   vector_store_ids: ["vs_abc123", "vs_abc124"]
                 }
               },
               tools: [
                 %Assistant.Tool.File.Search{
                   file_search: %Assistant.Tool.File.SearchFileSearch{
                     max_num_results: 10
                   },
                   type: "file_search"
                 },
                 %Assistant.Tool.Function{
                   function: %OpenAi.Function{
                     description: "Function description",
                     name: "Function name",
                     parameters: %{"key" => "value"}
                   },
                   type: "function"
                 },
                 %Assistant.Tool.Code{type: "code_interpreter"}
               ],
               top_p: 123
             } = assistant
    end
  end

  describe "modify_message/3" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/threads/a-abc123/messages/m-abc123"

        assert %{
                 "metadata" => %{"key" => "value"}
               } = request.body |> Poison.decode!()

        {:ok, Mocks.Assistant.message_update()}
      end)

      {:ok, message} =
        Assistants.modify_message("a-abc123", "m-abc123", %Message.UpdateRequest{
          metadata: %{"key" => "value"}
        })

      assert %Message{
               content: [
                 %{type: "image_file", image_file: %{file_id: "f_1234", detail: "auto"}},
                 %{
                   type: "image_url",
                   image_url: %{url: "https://example.com/image.jpg", detail: "auto"}
                 },
                 %{type: "text", text: %{}}
               ],
               created_at: 123,
               id: "m_abc1234",
               metadata: %{"key" => "value"},
               object: "thread.message",
               role: "user",
               thread_id: "t_abc1234"
             } = message
    end
  end

  describe "modify_run/3" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/threads/a-abc123/runs/r-abc123"

        assert %{
                 "metadata" => %{"key" => "value"}
               } = request.body |> Poison.decode!()

        {:ok, Mocks.Assistant.run_update()}
      end)

      {:ok, run} =
        Assistants.modify_run("a-abc123", "r-abc123", %Run.UpdateRequest{
          metadata: %{"key" => "value"}
        })

      assert %Run{} = run
    end
  end

  describe "modify_thread/2" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/threads/a-abc123"

        assert %{
                 "metadata" => %{"key" => "value"}
               } = request.body |> Poison.decode!()

        {:ok, Mocks.Assistant.thread_update()}
      end)

      {:ok, thread} =
        Assistants.modify_thread("a-abc123", %Thread.UpdateRequest{
          metadata: %{"key" => "value"}
        })

      assert %Thread{
               created_at: 1_699_061_776,
               id: "th_abc123",
               metadata: %{"key" => "value"},
               object: "thread",
               tool_resources: %Thread.ToolResources{
                 code_interpreter: %Thread.ToolResources.CodeInterpreter{
                   file_ids: [
                     "file_id",
                     "file_id"
                   ]
                 },
                 file_search: %Thread.ToolResources.FileSearch{
                   vector_store_ids: [
                     "vs_abc123",
                     "vs_abc124"
                   ]
                 }
               }
             } = thread
    end
  end

  describe "submit_tool_outputs_to_run/3" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post

        assert request.url ==
                 "https://api.openai.com/v1/threads/th-abc123/runs/r-abc123/submit_tool_outputs"

        assert [
                 %{
                   "stream" => true,
                   "tool_outputs" => %{"output" => "output", "tool_call_id" => "tc-abc123"}
                 }
               ] = request.body |> Poison.decode!()

        {:ok, Mocks.Assistant.submit_tool_outputs()}
      end)

      {:ok, run} =
        Assistants.submit_tool_ouputs_to_run("th-abc123", "r-abc123", [
          %Assistant.Tool.Outputs.RunSubmitRequest{
            stream: true,
            tool_outputs: %Assistant.Tool.Outputs.RunSubmitRequest.ToolOutputs{
              output: "output",
              tool_call_id: "tc-abc123"
            }
          }
        ])

      assert %Run{} = run
    end
  end
end
