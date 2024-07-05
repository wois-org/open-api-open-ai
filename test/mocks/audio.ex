defmodule Mocks.Audio do
  def transcription_verbose_json(data) do
    %{
      duration: "1.0",
      language: "en",
      segments: [
        %{
          avg_logprob: 0.0,
          compression_ratio: 0.0,
          end: 1.0,
          id: 0,
          no_speech_prob: 0.0,
          seek: 0,
          start: 0.0,
          temperature: 0.0,
          text: "Hello, world!",
          tokens: [0, 1]
        }
      ],
      text: "Hello, world!",
      words: [
        %{
          end: 0.5,
          start: 0.0,
          word: "Hello"
        },
        %{
          end: 1.0,
          start: 0.5,
          word: "world"
        }
      ]
    }
    |> Map.merge(data)
  end

  def translation_verbose_json(data) do
    %{
      duration: "1.0",
      language: "en",
      segments: [
        %{
          avg_logprob: 0.0,
          compression_ratio: 0.0,
          end: 1.0,
          id: 0,
          no_speech_prob: 0.0,
          seek: 0,
          start: 0.0,
          temperature: 0.0,
          text: "Hello, world!",
          tokens: [0, 1]
        }
      ],
      text: "Hello, world!"
    }
    |> Map.merge(data)
  end

  def create_speech(data \\ "audio_file_contents") do
    %HTTPoison.Response{
      status_code: 200,
      body: data
    }
  end

  def create_transcription_json(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        %{
          text: "Hello, world!"
        }
        |> Map.merge(data)
        |> Poison.encode!()
    }
  end

  def create_transcription_verbose_json(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> transcription_verbose_json()
        |> Poison.encode!()
    }
  end

  def create_translation_json(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        %{
          text: "Hello, world!"
        }
        |> Map.merge(data)
        |> Poison.encode!()
    }
  end

  def create_translation_verbose_json(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> translation_verbose_json()
        |> Poison.encode!()
    }
  end
end
