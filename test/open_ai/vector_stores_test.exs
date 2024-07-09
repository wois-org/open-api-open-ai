defmodule Operations.VectorStoresTest do
  use ExUnit.Case
  import Mox

  alias OpenAi.VectorStores
  alias OpenAi.VectorStore

  describe "cancel_vector_store_file_batch/2" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post

        assert request.url ==
                 "https://api.openai.com/v1/vector_stores/vs_abc123/file_batches/fb_abc123/cancel"

        {:ok,
         OpenAi.Mocks.VectorStoreFileBatch.cancel(%{
           id: "vsfb_abc123",
           status: "cancelled"
         })}
      end)

      {:ok, file_batch} = VectorStores.cancel_vector_store_file_batch("vs_abc123", "fb_abc123")

      assert %VectorStore.File.Batch{
               id: "vsfb_abc123",
               status: "cancelled"
             } = file_batch
    end
  end

  describe "create_vector_store/2" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/vector_stores"

        assert %{
                 "name" => "test",
                 "metadata" => %{
                   "test" => "test"
                 }
               } = Poison.decode!(request.body)

        {:ok,
         OpenAi.Mocks.VectorStore.create(%{
           name: "vector store test name",
           metadata: %{
             "test" => "test"
           }
         })}
      end)

      {:ok, vector_store} =
        %VectorStore.CreateRequest{
          name: "test",
          metadata: %{
            test: "test"
          }
        }
        |> VectorStores.create_vector_store()

      assert %VectorStore{
               id: "vs_abc123",
               metadata: %{
                 "test" => "test"
               },
               file_counts: %VectorStore.File.Counts{
                 completed: 3,
                 in_progress: 0,
                 total: 3,
                 cancelled: 0,
                 failed: 0
               }
             } = vector_store
    end
  end

  describe "create_vector_store_file/2" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/vector_stores/vs_abc123/files"

        assert %{
                 "file_id" => "vsf_abc123",
                 "chunking_strategy" => %{
                   "static" => %{
                     "chunk_overlap_tokens" => 100,
                     "max_chunk_size_tokens" => 1000
                   },
                   "type" => "static"
                 }
               } = Poison.decode!(request.body)

        {:ok,
         OpenAi.Mocks.VectorStoreFile.create(%{
           id: "vsf_abc123",
           status: "completed"
         })}
      end)

      {:ok, vector_store_file} =
        VectorStores.create_vector_store_file(
          "vs_abc123",
          %VectorStore.File.CreateRequest{
            file_id: "vsf_abc123",
            chunking_strategy: %VectorStore.File.ChunkingStrategy.Static.RequestParam{
              static: %VectorStore.File.ChunkingStrategy.Static{
                max_chunk_size_tokens: 1000,
                chunk_overlap_tokens: 100
              },
              type: "static"
            }
          }
        )

      assert %VectorStore.File{
               id: "vsf_abc123",
               status: "completed"
             } = vector_store_file
    end
  end

  describe "create_vector_store_file_batch/2" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/vector_stores/vs_abc123/file_batches"

        assert %{
                 "file_ids" => ["vsf_abc123"],
                 "chunking_strategy" => %{
                   "static" => %{
                     "chunk_overlap_tokens" => 100,
                     "max_chunk_size_tokens" => 1000
                   },
                   "type" => "static"
                 }
               } = Poison.decode!(request.body)

        {:ok,
         OpenAi.Mocks.VectorStoreFileBatch.create(%{
           id: "vsfb_abc123",
           status: "in_progress"
         })}
      end)

      {:ok, vector_store_file_batch} =
        VectorStores.create_vector_store_file_batch(
          "vs_abc123",
          %VectorStore.File.Batch.CreateRequest{
            file_ids: ["vsf_abc123"],
            chunking_strategy: %VectorStore.File.ChunkingStrategy.Static.RequestParam{
              static: %VectorStore.File.ChunkingStrategy.Static{
                max_chunk_size_tokens: 1000,
                chunk_overlap_tokens: 100
              },
              type: "static"
            }
          }
        )

      assert %VectorStore.File.Batch{
               id: "vsfb_abc123",
               status: "in_progress"
             } = vector_store_file_batch
    end
  end

  describe "delete_vector_store/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :delete
        assert request.url == "https://api.openai.com/v1/vector_stores/vs_abc123"

        {:ok, OpenAi.Mocks.VectorStore.delete(%{id: "vs_abc123"})}
      end)

      {:ok, vector_store_delete_response} = VectorStores.delete_vector_store("vs_abc123")

      assert %VectorStore.DeleteResponse{
               id: "vs_abc123",
               object: "vector_store.deleted",
               deleted: true
             } = vector_store_delete_response
    end
  end

  describe "get_vector_store/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/vector_stores/vs_abc123"

        {:ok,
         OpenAi.Mocks.VectorStore.get(%{
           id: "vs_abc123",
           metadata: %{
             "test" => "test"
           }
         })}
      end)

      {:ok, vector_store} = VectorStores.get_vector_store("vs_abc123")

      assert %VectorStore{
               id: "vs_abc123",
               metadata: %{
                 "test" => "test"
               },
               file_counts: %VectorStore.File.Counts{
                 completed: 3,
                 in_progress: 0,
                 total: 3,
                 cancelled: 0,
                 failed: 0
               }
             } = vector_store
    end
  end

  describe "get_vector_store_file/2" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/vector_stores/vs_abc123/files/vsf_abc123"

        {:ok,
         OpenAi.Mocks.VectorStoreFile.get(%{
           id: "vsf_abc123",
           status: "completed"
         })}
      end)

      {:ok, vector_store_file} = VectorStores.get_vector_store_file("vs_abc123", "vsf_abc123")

      assert %VectorStore.File{
               id: "vsf_abc123",
               status: "completed"
             } = vector_store_file
    end
  end

  describe "get_vector_store_file_batch/2" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get

        assert request.url ==
                 "https://api.openai.com/v1/vector_stores/vs_abc123/file_batches/vsfb_abc123"

        {:ok,
         OpenAi.Mocks.VectorStoreFileBatch.get(%{
           id: "vsfb_abc123",
           status: "in_progress"
         })}
      end)

      {:ok, vector_store_file_batch} =
        VectorStores.get_vector_store_file_batch("vs_abc123", "vsfb_abc123")

      assert %VectorStore.File.Batch{
               id: "vsfb_abc123",
               status: "in_progress"
             } = vector_store_file_batch
    end
  end

  describe "list_files_in_vector_store_batch/2" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get

        assert request.url ==
                 "https://api.openai.com/v1/vector_stores/vs_abc123/file_batches/vsfb_abc123/files"

        {:ok,
         OpenAi.Mocks.VectorStoreFile.list(
           [
             %{
               id: "vsf_abc123",
               status: "in_progress"
             },
             %{
               id: "vsf_abc124",
               status: "completed"
             }
           ],
           2
         )}
      end)

      {:ok, vector_store_file_list} =
        VectorStores.list_files_in_vector_store_batch("vs_abc123", "vsfb_abc123")

      assert %OpenAi.VectorStore.File.ListResponse{
               data: [
                 %OpenAi.VectorStore.File{
                   id: "vsf_abc123",
                   object: "vector_store.file",
                   status: "in_progress"
                 },
                 %OpenAi.VectorStore.File{
                   id: "vsf_abc124",
                   object: "vector_store.file",
                   status: "completed"
                 }
               ],
               first_id: "vsf_abc123",
               has_more: false,
               last_id: "vsf_abc124",
               object: "list"
             } = vector_store_file_list
    end
  end

  describe "list_vector_store_files/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/vector_stores/vs_abc123/files"

        {:ok,
         OpenAi.Mocks.VectorStoreFile.list(
           [
             %{
               id: "vsf_abc123",
               status: "in_progress"
             },
             %{
               id: "vsf_abc124",
               status: "completed"
             }
           ],
           2
         )}
      end)

      {:ok, vector_store_file_list} = VectorStores.list_vector_store_files("vs_abc123")

      assert %OpenAi.VectorStore.File.ListResponse{
               data: [
                 %OpenAi.VectorStore.File{
                   id: "vsf_abc123",
                   object: "vector_store.file",
                   status: "in_progress"
                 },
                 %OpenAi.VectorStore.File{
                   id: "vsf_abc124",
                   object: "vector_store.file",
                   status: "completed"
                 }
               ],
               first_id: "vsf_abc123",
               has_more: false,
               last_id: "vsf_abc124",
               object: "list"
             } = vector_store_file_list
    end
  end

  describe "list_vector_stores/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/vector_stores"

        {:ok,
         OpenAi.Mocks.VectorStore.list(
           [
             %{
               id: "vs_abc123",
               name: "Support FAQ",
               bytes: 139_920,
               file_counts: %{
                 "in_progress" => 0,
                 "completed" => 3,
                 "failed" => 0,
                 "cancelled" => 0,
                 "total" => 3
               }
             },
             %{
               id: "vs_abc124",
               name: "Support FAQ",
               bytes: 139_920,
               file_counts: %{
                 "in_progress" => 0,
                 "completed" => 3,
                 "failed" => 0,
                 "cancelled" => 0,
                 "total" => 3
               }
             }
           ],
           2
         )}
      end)

      {:ok, vector_store_list} = VectorStores.list_vector_stores()

      assert %OpenAi.VectorStore.ListResponse{
               data: [
                 %OpenAi.VectorStore{
                   id: "vs_abc123",
                   object: "vector_store",
                   name: "Support FAQ",
                   file_counts: %OpenAi.VectorStore.File.Counts{
                     cancelled: 0,
                     completed: 3,
                     failed: 0,
                     in_progress: 0,
                     total: 3
                   }
                 },
                 %OpenAi.VectorStore{
                   id: "vs_abc124",
                   object: "vector_store",
                   name: "Support FAQ",
                   file_counts: %OpenAi.VectorStore.File.Counts{
                     cancelled: 0,
                     completed: 3,
                     failed: 0,
                     in_progress: 0,
                     total: 3
                   }
                 }
               ],
               first_id: "vs_abc123",
               has_more: false,
               last_id: "vs_abc124",
               object: "list"
             } = vector_store_list
    end
  end

  describe "modify_vector_store" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/vector_stores/vs_abc123"

        assert %{
                 "name" => "test",
                 "metadata" => %{
                   "test" => "test"
                 }
               } = Poison.decode!(request.body)

        {:ok,
         OpenAi.Mocks.VectorStore.create(%{
           name: "vector store test name",
           metadata: %{
             "test" => "test"
           }
         })}
      end)

      {:ok, vector_store} =
        "vs_abc123"
        |> VectorStores.modify_vector_store(%VectorStore.UpdateRequest{
          name: "test",
          metadata: %{
            test: "test"
          }
        })

      assert %VectorStore{
               id: "vs_abc123",
               metadata: %{
                 "test" => "test"
               },
               file_counts: %VectorStore.File.Counts{
                 completed: 3,
                 in_progress: 0,
                 total: 3,
                 cancelled: 0,
                 failed: 0
               }
             } = vector_store
    end
  end
end
