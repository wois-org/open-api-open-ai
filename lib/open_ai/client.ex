defmodule OpenAi.Client do
  @moduledoc """
  Module responsible for making requests to the OpenAI API.
  And transforming the response to the expected response type.
  """
  alias OpenAi.Config

  @doc """
  Makes a request to the OpenAI API
  based on the provided parameters.

  Returns the response body transformed
  to the expected response type.

  Primarily used by the operation modules.
  """
  def request(
        %{
          method: method,
          url: url,
          response: expected_response
        } = params
      ) do
    %HTTPoison.Request{
      method: method,
      url: Path.join(Config.base_url(), url),
      headers:
        [
          {"Authorization", "Bearer #{Config.api_key()}"}
        ]
        |> Kernel.++(params |> add_content_type_header())
        |> Kernel.++(Config.http_headers!()),
      params: params |> Map.get(:query),
      options: Config.http_options() ++ Map.get(params, :opts, [])
    }
    |> attach_body(params)
    |> Config.http_client().request()
    |> transform_to_expected_response(expected_response)
  end

  defp add_content_type_header(%{request: request} = _params) do
    request
    |> Enum.find(fn
      {"multipart/form-data", _} -> true
      _ -> false
    end)
    |> case do
      {"multipart/form-data", {_struct, _}} ->
        [{"Content-Type", "multipart/form-data"}]

      _ ->
        [{"Content-Type", "application/json"}]
    end
  end

  defp add_content_type_header(_) do
    [{"Content-Type", "application/json"}]
  end

  defp attach_body(%{method: method} = request, %{
         request: [{"multipart/form-data", _}],
         body: %{file: file_path} = body
       })
       when method in [:post, :put, :patch, :delete, :options] do
    body =
      body
      |> Map.delete(:file)
      |> remove_nil_values()
      |> Map.to_list()
      |> Enum.map(fn {k, v} -> {"#{k}", v} end)

    multi =
      {:file, "#{file_path}",
       {"form-data", [name: "file", filename: file_path |> Path.basename()]}, []}

    request
    |> Map.put(:body, {:multipart, [multi | body]})
  end

  defp attach_body(%{method: method} = request, %{body: body})
       when method in [:post, :put, :patch, :delete, :options] and
              (body |> is_map or body |> is_list) do
    body =
      body
      |> remove_nil_values()
      |> Poison.encode!()

    request |> Map.put(:body, body)
  end

  defp attach_body(request, _params) do
    request
  end

  defp remove_nil_values(struct) when struct |> is_struct() do
    struct
    |> Map.from_struct()
    |> remove_nil_values()
  end

  defp remove_nil_values(map) when map |> is_map do
    map
    |> Enum.filter(fn {_, v} -> v != nil end)
    |> Enum.reduce(%{}, fn {k, v}, acc ->
      Map.put(acc, k, v |> remove_nil_values())
    end)
  end

  defp remove_nil_values(list) when list |> is_list do
    list
    |> Enum.filter(fn v -> v != nil end)
    |> Enum.map(&remove_nil_values/1)
  end

  defp remove_nil_values(v), do: v

  defp transform_to_expected_response(
         {:ok,
          %HTTPoison.Response{
            status_code: response_status_code,
            body: body
          }},
         [{expected_status_code, {:string, :generic}}]
       )
       when response_status_code == expected_status_code do
    {:ok, body}
  end

  defp transform_to_expected_response(
         {:ok,
          %HTTPoison.Response{
            status_code: response_status_code,
            body: body
          }},
         [{expected_status_code, expected_type}]
       )
       when response_status_code == expected_status_code do
    body
    |> Poison.decode()
    |> case do
      {:ok, decoded_body} ->
        decoded_body |> __MODULE__.Value.transform(expected_type)

      {:error, _} ->
        {:error, "Failed to decode response body for #{inspect(expected_type)}"}
    end
  end

  defp transform_to_expected_response(
         {:ok,
          %HTTPoison.Response{
            status_code: response_status_code,
            body: body
          }},
         _
       ) do
    body =
      body
      |> Poison.decode()
      |> case do
        {:ok, res} -> res
        {:error, _} -> body
      end

    {:error,
     %{
       status_code: response_status_code,
       body: body
     }}
  end

  defp transform_to_expected_response(
         {:ok, %HTTPoison.AsyncResponse{} = resp},
         _expected_response
       ) do
    resp |> __MODULE__.Stream.transform()
  end

  defp transform_to_expected_response(
         {:error, %HTTPoison.Error{reason: reason}},
         _expected_response
       ) do
    {:error, reason}
  end

  defp transform_to_expected_response({:error, error}, _expected_response) do
    {:error, error}
  end
end
