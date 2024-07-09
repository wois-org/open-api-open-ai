defmodule OpenAi.Config do
  @moduledoc """
  Module responsible for managing the configuration of the OpenAI API client.
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
end
