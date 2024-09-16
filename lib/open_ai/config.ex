defmodule OpenAi.Config do
  @moduledoc """
  Module responsible for managing the configuration of the OpenAI API client.

  You can configure openai in your mix config.exs (default $project_root/config/config.exs). If you're using Phoenix add the configuration in your config/dev.exs|test.exs|prod.exs files. An example config is:

    ```elixir
    config :oapi_open_ai,
      # find it at https://platform.openai.com/account/api-keys
      api_key: "your-api-key",
      # optional, use when required by an OpenAI API beta, e.g.:
      beta: "assistants=v1",
      # optional, HTTP client defaults to HTTPoison, useful for mocking in tests
      http_client: HTTPoisonMock,
      # optional, passed to HTTPoison.Request options
      http_options: [recv_timeout: 30_000]
    ```
  Note: you can load your os ENV variables in the configuration file, if you set an env variable for API key named `OPENAI_API_KEY` you can get it in the code by doing `System.get_env("OPENAI_API_KEY")`.

  More info on possible `http_options` configuration: [HTTPoison.Request](https://hexdocs.pm/httpoison/HTTPoison.Request.html)

  The `config.exs` is compile time, so the `get_env/1` function is executed during the build, if you want to get the env variables during runtime please use `runtime.exs` instead of `config.exs` in your application ([elixir doc ref](https://elixir-lang.org/getting-started/mix-otp/config-and-releases.html#configuration)).
  """



  @doc """
  Returns the base URL for the OpenAI API.
  Defaults to "https://api.openai.com/v1/".
  """
  def base_url() do
    Application.get_env(:oapi_open_ai, :base_url, "https://api.openai.com/v1/")
  end

  @doc """
  Returns the API key for the OpenAI API.

  This is required for making requests to the API.
  find it at https://platform.openai.com/account/api-keys
  """
  def api_key() do
    Application.get_env(:oapi_open_ai, :api_key)
  end

  @doc """
  Returns the HTTP client module to use for making requests.
  Defaults to HTTPoison.

  This is useful for testing, where you might want to use a mock HTTP client.
  """
  def http_client() do
    Application.get_env(:oapi_open_ai, :http_client, HTTPoison)
  end

  @doc """
  Returns the HTTP headers to include in the request.

  Will throw if the headers are not a list.
  """
  def http_headers!() do
    Application.get_env(:oapi_open_ai, :http_headers, [])
    |> case do
      headers when headers |> is_list() -> headers
      headers -> throw("Expected a list of headers, got: #{inspect(headers)}")
    end
  end

  def http_options() do
    Application.get_env(:oapi_open_ai, :http_options, [])
  end
end
