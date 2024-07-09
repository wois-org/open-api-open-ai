defmodule OpenAi.BatchTest do
  use ExUnit.Case
  import Mox

  alias OpenAi.Batch

  describe "cancel_batch/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/batches/b_abc123/cancel"

        {:ok, OpenAi.Mocks.Batch.cancel()}
      end)

      {:ok, response} = Batch.cancel_batch("b_abc123")

      assert %Batch{
               id: "b_abc123",
               object: "batch",
               status: "cancelled"
             } = response
    end
  end

  describe "create_batch/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post

        assert %{
                 "completion_window" => "24h",
                 "endpoint" => "/v1/chat/completions",
                 "input_file_id" => "file-abc123"
               } = Poison.decode!(request.body)

        assert request.url == "https://api.openai.com/v1/batches"

        {:ok, OpenAi.Mocks.Batch.create()}
      end)

      {:ok, batch} =
        %{
          input_file_id: "file-abc123",
          endpoint: "/v1/chat/completions",
          completion_window: "24h"
        }
        |> Batch.create_batch()

      assert %Batch{
               id: "b_abc123",
               object: "batch",
               status: "validating"
             } = batch
    end
  end

  describe "list_batches/0" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/batches"

        {:ok,
         OpenAi.Mocks.Batch.list([
           %{id: "b_abc123"},
           %{id: "b_abc124"}
         ])}
      end)

      {:ok, list_response} = Batch.list_batches()

      assert %Batch.ListResponse{
               data: [
                 %Batch{id: "b_abc123"},
                 %Batch{id: "b_abc124"}
               ],
               first_id: "b_abc123",
               has_more: false,
               last_id: "b_abc124",
               object: "list"
             } = list_response
    end
  end

  describe "retrieve_batch/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/batches/b_abc123"

        {:ok, OpenAi.Mocks.Batch.get()}
      end)

      {:ok, batch} = Batch.retrieve_batch("b_abc123")

      assert %Batch{
               id: "b_abc123",
               object: "batch",
               status: "completed"
             } = batch
    end
  end
end
