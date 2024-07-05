defmodule OpenAi.Audio do
  @moduledoc """
  Provides API endpoints related to audio
  """

  @default_client OpenAi.Client

  @doc """
  Generates audio from the input text.
  """
  @spec create_speech(OpenAi.Audio.Speech.CreateRequest.t(), keyword) ::
          {:ok, String.t()} | :error
  def create_speech(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Audio, :create_speech},
      url: "/audio/speech",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAi.Audio.Speech.CreateRequest, :t}}],
      response: [{200, {:string, :generic}}],
      opts: opts
    })
  end

  @doc """
  Transcribes audio into the input language.
  """
  @spec create_transcription(OpenAi.Audio.Transcription.CreateRequest.t(), keyword) ::
          {:ok,
           OpenAi.Audio.Transcription.CreateResponse.Json.t()
           | OpenAi.Audio.Transcription.CreateResponse.VerboseJson.t()}
          | :error
  def create_transcription(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Audio, :create_transcription},
      url: "/audio/transcriptions",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {OpenAi.Audio.Transcription.CreateRequest, :t}}],
      response: [
        {200,
         {:union,
          [
            {OpenAi.Audio.Transcription.CreateResponse.Json, :t},
            {OpenAi.Audio.Transcription.CreateResponse.VerboseJson, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @doc """
  Translates audio into English.
  """
  @spec create_translation(OpenAi.Audio.Translation.CreateRequest.t(), keyword) ::
          {:ok,
           OpenAi.Audio.Translation.CreateResponse.Json.t()
           | OpenAi.Audio.Translation.CreateResponse.VerboseJson.t()}
          | :error
  def create_translation(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAi.Audio, :create_translation},
      url: "/audio/translations",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {OpenAi.Audio.Translation.CreateRequest, :t}}],
      response: [
        {200,
         {:union,
          [
            {OpenAi.Audio.Translation.CreateResponse.Json, :t},
            {OpenAi.Audio.Translation.CreateResponse.VerboseJson, :t}
          ]}}
      ],
      opts: opts
    })
  end
end
