defmodule OpenAi.EmbeddingsTest do
  use ExUnit.Case
  import Mox

  alias OpenAi.Embeddings
  alias OpenAi.Embedding

  describe "create_embedding/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post

        assert %{
                 "dimensions" => 3,
                 "encoding_format" => "float32",
                 "input" => "input",
                 "model" => "text-embedding-ada-002",
                 "user" => "user"
               } = Poison.decode!(request.body)

        assert request.url == "https://api.openai.com/v1/embeddings"

        {:ok, Mocks.Embedding.create_response()}
      end)

      {:ok, embedding} =
        %Embedding.CreateRequest{
          dimensions: 3,
          encoding_format: "float32",
          input: "input",
          model: "text-embedding-ada-002",
          user: "user"
        }
        |> Embeddings.create_embedding()

      assert %Embedding.CreateResponse{
               data: [
                 %{
                   embedding: [0.1, 0.2, 0.3],
                   index: 0,
                   object: "embedding"
                 },
                 %{
                   embedding: [0.1, 0.2, 0.3],
                   index: 0,
                   object: "embedding"
                 }
               ],
               model: "text-embedding-ada-002",
               usage: %{
                 prompt_tokens: 123,
                 total_tokens: 456
               },
               object: "list"
             } = embedding
    end
  end
end
