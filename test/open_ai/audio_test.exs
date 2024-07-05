defmodule OpenAi.AudioTest do
  use ExUnit.Case
  import Mox

  alias OpenAi.Audio

  describe "create_speech/1" do
    test "correct parameters" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/audio/speech"

        {:ok, Mocks.Audio.create_speech()}
      end)

      {:ok, response} =
        %Audio.Speech.CreateRequest{
          input: "Hello, world!",
          model: "tts-1",
          response_format: "mp3",
          speed: 1,
          voice: "alloy"
        }
        |> Audio.create_speech()

      assert response == "audio_file_contents"
    end
  end

  describe "create_transcription/1" do
    test "correct parameters returns json" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/audio/transcriptions"

        {:ok, Mocks.Audio.create_transcription_json()}
      end)

      {:ok, response} =
        %Audio.Transcription.CreateRequest{
          file: "audio_file_contents",
          language: "en",
          model: "stt-1",
          response_format: "json",
          temperature: 0.5,
          "timestamp_granularities[]": ["word"]
        }
        |> Audio.create_transcription()

      assert %Audio.Transcription.CreateResponse.Json{
               text: "Hello, world!"
             } = response
    end

    test "correct parameters returns verbose json" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/audio/transcriptions"

        {:ok, Mocks.Audio.create_transcription_verbose_json()}
      end)

      {:ok, response} =
        %Audio.Transcription.CreateRequest{
          file: "audio_file_contents",
          language: "en",
          model: "stt-1",
          response_format: "verbose_json",
          temperature: 0.5,
          "timestamp_granularities[]": ["word"]
        }
        |> Audio.create_transcription()

      assert %Audio.Transcription.CreateResponse.VerboseJson{
               duration: "1.0",
               segments: [
                 %OpenAi.Audio.Transcription.Segment{
                   text: "Hello, world!",
                   avg_logprob: +0.0,
                   compression_ratio: +0.0,
                   end: 1.0,
                   id: 0,
                   no_speech_prob: +0.0,
                   seek: 0,
                   start: +0.0,
                   temperature: +0.0,
                   tokens: [0, 1]
                 }
               ],
               text: "Hello, world!",
               words: [
                 %OpenAi.Audio.Transcription.Word{
                   end: 0.5,
                   start: +0.0,
                   word: "Hello"
                 },
                 %OpenAi.Audio.Transcription.Word{
                   end: 1.0,
                   start: 0.5,
                   word: "world"
                 }
               ],
               language: "en"
             } = response
    end
  end

  describe "create_translation/1" do
    test "correct parameters json" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/audio/translations"

        {:ok, Mocks.Audio.create_translation_json()}
      end)

      {:ok, response} =
        %Audio.Translation.CreateRequest{
          file: "audio_file_contents",
          model: "whisper-1",
          prompt: "Hello, world!",
          response_format: "json",
          temperature: 0.5
        }
        |> Audio.create_translation()

      assert %Audio.Translation.CreateResponse.Json{
               text: "Hello, world!"
             } = response
    end

    test "correct parameters verbose json" do
      expect(HTTPoisonMock, :request, fn request ->
        assert request.method == :post
        assert request.url == "https://api.openai.com/v1/audio/translations"

        {:ok, Mocks.Audio.create_translation_verbose_json()}
      end)

      {:ok, response} =
        %Audio.Translation.CreateRequest{
          file: "audio_file_contents",
          model: "whisper-1",
          prompt: "Hello, world!",
          response_format: "verbose_json",
          temperature: 0.5
        }
        |> Audio.create_translation()

      assert %Audio.Translation.CreateResponse.VerboseJson{
               duration: "1.0",
               language: "en",
               segments: [
                 %OpenAi.Audio.Transcription.Segment{
                   text: "Hello, world!",
                   avg_logprob: +0.0,
                   compression_ratio: +0.0,
                   end: 1.0,
                   id: 0,
                   no_speech_prob: +0.0,
                   seek: 0,
                   start: +0.0,
                   temperature: +0.0,
                   tokens: [0, 1]
                 }
               ],
               text: "Hello, world!"
             } = response
    end
  end
end
