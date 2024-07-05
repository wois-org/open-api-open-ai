defmodule OpenAi.ImagesTest do
  use ExUnit.Case
  import Mox

  alias OpenAi.Images
  alias OpenAi.Image

  describe "create_image/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post

        assert %{
                 "model" => "dall-e-2",
                 "n" => 1,
                 "prompt" => "A painting of a sunset over a mountain",
                 "quality" => "standard",
                 "response_format" => "url",
                 "size" => "256x256",
                 "style" => "vivid",
                 "user" => "acemeco"
               } = Poison.decode!(request.body)

        assert request.url ==
                 "https://api.openai.com/v1/images/generations"

        {:ok, Mocks.Image.create([], 1)}
      end)

      {:ok, response} =
        %Image.CreateRequest{
          model: "dall-e-2",
          n: 1,
          prompt: "A painting of a sunset over a mountain",
          quality: "standard",
          response_format: "url",
          size: "256x256",
          style: "vivid",
          user: "acemeco"
        }
        |> Images.create_image()

      assert %Image.Response{
               created: 163,
               data: [
                 %Image{
                   b64_json: nil,
                   revised_prompt: nil,
                   url: "https://api.openai.com/v1/images/ft:dall-e-2:acemeco:suffix:abc123"
                 }
               ]
             } = response
    end
  end

  describe "create_image_edit/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post

        assert %{
                 "image" => "@otter.png",
                 "mask" => "@otter_mask.png",
                 "model" => "dall-e-2",
                 "n" => 1,
                 "prompt" => "A painting of a sunset over a mountain",
                 "response_format" => "url",
                 "size" => "256x256",
                 "user" => "acemeco"
               } = Poison.decode!(request.body)

        assert request.url ==
                 "https://api.openai.com/v1/images/edits"

        {:ok, Mocks.Image.create([], 1)}
      end)

      {:ok, response} =
        %Image.EditCreateRequest{
          image: "@otter.png",
          mask: "@otter_mask.png",
          model: "dall-e-2",
          n: 1,
          prompt: "A painting of a sunset over a mountain",
          response_format: "url",
          size: "256x256",
          user: "acemeco"
        }
        |> Images.create_image_edit()

      assert %Image.Response{
               created: 163,
               data: [
                 %Image{
                   b64_json: nil,
                   revised_prompt: nil,
                   url: "https://api.openai.com/v1/images/ft:dall-e-2:acemeco:suffix:abc123"
                 }
               ]
             } = response
    end
  end

  describe "create_image_variation/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post

        assert %{
                 "image" => "@otter.png",
                 "model" => "dall-e-2",
                 "n" => 1,
                 "response_format" => "url",
                 "size" => "256x256",
                 "user" => "acemeco"
               } = Poison.decode!(request.body)

        assert request.url ==
                 "https://api.openai.com/v1/images/variations"

        {:ok, Mocks.Image.create([], 1)}
      end)

      {:ok, response} =
        %Image.VariationCreateRequest{
          image: "@otter.png",
          model: "dall-e-2",
          n: 1,
          response_format: "url",
          size: "256x256",
          user: "acemeco"
        }
        |> Images.create_image_variation()

      assert %Image.Response{
               created: 163,
               data: [
                 %Image{
                   b64_json: nil,
                   revised_prompt: nil,
                   url: "https://api.openai.com/v1/images/ft:dall-e-2:acemeco:suffix:abc123"
                 }
               ]
             } = response
    end
  end
end
