defmodule OpenAi.ModelsTest do
  use ExUnit.Case
  import Mox

  alias OpenAi.Models
  alias OpenAi.Model

  describe "delete_model/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :delete

        assert request.url ==
                 "https://api.openai.com/v1/models/text-moderation-latest"

        {:ok, OpenAi.Mocks.Model.delete()}
      end)

      {:ok, response} = Models.delete_model("text-moderation-latest")

      assert %Model.DeleteResponse{
               id: "ft:gpt-3.5-turbo:acemeco:suffix:abc123",
               deleted: true,
               object: "model"
             } = response
    end
  end

  describe "list_models/0" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get

        assert request.url ==
                 "https://api.openai.com/v1/models"

        {:ok, OpenAi.Mocks.Model.list()}
      end)

      {:ok, response} = Models.list_models()

      assert %Model.ListResponse{
               data: [
                 %Model{
                   id: "davinci",
                   owned_by: "openai",
                   object: "model"
                 },
                 %Model{
                   id: "davinci",
                   owned_by: "openai",
                   object: "model"
                 }
               ],
               object: "list"
             } = response
    end
  end

  describe "retrieve_model/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get

        assert request.url ==
                 "https://api.openai.com/v1/models/text-moderation-latest"

        {:ok, OpenAi.Mocks.Model.get()}
      end)

      {:ok, response} = Models.retrieve_model("text-moderation-latest")

      assert %Model{
               id: "davinci",
               owned_by: "openai",
               object: "model"
             } = response
    end
  end
end
