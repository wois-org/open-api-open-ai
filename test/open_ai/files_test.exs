defmodule OpenAi.FilesTest do
  use ExUnit.Case
  import Mox

  alias OpenAi.Files
  alias OpenAi.File

  describe "create_file/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post

        assert %{
                 "file" => "file",
                 "purpose" => "fine-tune"
               } = Poison.decode!(request.body)

        assert request.url == "https://api.openai.com/v1/files"

        {:ok, Mocks.File.create()}
      end)

      {:ok, file} =
        %File.CreateRequest{
          file: "file",
          purpose: "fine-tune"
        }
        |> Files.create_file()

      assert %File{
               bytes: 139_920,
               created_at: 1_699_061_776,
               filename: "Support FAQ",
               id: "f_abc123",
               object: "file",
               purpose: "fine-tune"
             } = file
    end
  end

  describe "delete_file/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :delete
        assert request.url == "https://api.openai.com/v1/files/f_abc123"

        {:ok, Mocks.File.delete()}
      end)

      {:ok, response} = Files.delete_file("f_abc123")

      assert %File.DeleteResponse{
               id: "f_abc123",
               object: "file",
               deleted: true
             } = response
    end
  end

  describe "download_file/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/files/f_abc123/content"

        {:ok, Mocks.File.download()}
      end)

      {:ok, content} = Files.download_file("f_abc123")

      assert "This is the content of the file." == content
    end
  end

  describe "list_files/0" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/files"

        {:ok, Mocks.File.list()}
      end)

      {:ok, response} = Files.list_files()

      assert %File.ListResponse{
               data: [
                 %File{
                   bytes: 139_920,
                   created_at: 1_699_061_776,
                   filename: "Support FAQ",
                   id: "f_abc123",
                   object: "file",
                   purpose: "fine-tune"
                 },
                 %File{}
               ],
               object: "list"
             } = response
    end
  end

  describe "retrieve_file/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :get
        assert request.url == "https://api.openai.com/v1/files/f_abc123"

        {:ok, Mocks.File.get()}
      end)

      {:ok, file} = Files.retrieve_file("f_abc123")

      assert %File{
               bytes: 139_920,
               created_at: 1_699_061_776,
               filename: "Support FAQ",
               id: "f_abc123",
               object: "file",
               purpose: "fine-tune"
             } = file
    end
  end
end
