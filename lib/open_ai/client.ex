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
      params: params |> Map.get(:query)
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
        transform_value(decoded_body, expected_type)

      {:error, _} ->
        {:error, "Failed to decode response body"}
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

  defp transform_to_expected_response({:error, %HTTPoison.Error{reason: reason}}, _) do
    {:error, reason}
  end

  defp transform_to_expected_response({:error, error}, _) do
    {:error, error}
  end

  defp transform_value(v, :integer) when is_integer(v), do: {:ok, v}
  defp transform_value(v, :integer), do: {:error, "Expected integer, got #{inspect(v)}"}
  defp transform_value(v, :number) when is_number(v), do: {:ok, v}
  defp transform_value(v, :number), do: {:error, "Expected number, got #{inspect(v)}"}
  defp transform_value(v, {:string, _type}) when is_binary(v), do: {:ok, v}
  defp transform_value(v, {:string, _type}), do: {:error, "Expected string, got #{inspect(v)}"}
  defp transform_value(v, {:const, const}) when const == v, do: {:ok, v}
  defp transform_value(v, {:const, const}), do: {:error, "Expected const: #{const}, got #{v}"}
  defp transform_value(v, {:enum, values}), do: in_enum(v, values)
  defp transform_value(v, :boolean) when is_boolean(v), do: {:ok, v}
  defp transform_value(v, :boolean), do: {:error, "Expected boolean, got #{inspect(v)}"}
  defp transform_value(v, :map) when is_map(v), do: {:ok, v}
  defp transform_value(v, :map), do: {:error, "Expected map, got #{inspect(v)}"}
  defp transform_value(v, {:union, types}), do: transform_value(v, collapse_union(types, v))

  defp transform_value(v, {struct, base_type}) when is_map(v),
    do: transform_struct(v, struct, base_type)

  defp transform_value(v, type) when is_list(v) and is_list(type),
    do: transform_list(v, type |> List.first())

  defp transform_value(v, {:union, types}) when is_list(v) and is_list(types),
    do: transform_list(v, types)

  defp transform_value(v, type),
    do: {:error, "Failed to transform value: #{inspect(v)} to type: #{inspect(type)}"}

  defp transform_struct(map, struct, base_type)
       when map |> is_map and struct |> is_atom and base_type |> is_atom do
    struct.__fields__(base_type)
    |> Enum.reduce({:ok, struct.__struct__(%{})}, &transform_struct_reducer(&1, &2, map))
  end

  defp transform_struct(map, struct, base_type) do
    {:error,
     """
     Some parameters are of incorrect type
     Expected map, got: #{inspect(map)}
     Expected struct(atom) got: #{inspect(struct)}
     Expected base_type(atom) got: #{inspect(base_type)}
     """}
  end

  defp transform_struct_reducer({field, type}, {:ok, acc}, map) do
    map
    |> Map.get(field |> Atom.to_string(), nil)
    |> case do
      nil ->
        # TODO check if field is nullable
        {:ok, acc}

      value ->
        value
        |> transform_value(type)
        |> case do
          {:ok, v} -> {:ok, Map.put(acc, field, v)}
          {:error, e} -> {:error, "Field #{field} error: " <> e}
        end
    end
  end

  defp transform_struct_reducer(_, {:error, e}, _) do
    {:error, e}
  end

  defp in_enum(value, enum) do
    if Enum.member?(enum, value) do
      {:ok, value}
    else
      {:error, "Expected one of #{inspect(enum)}, got #{value}"}
    end
  end

  defp transform_list(list, type) when list |> is_list do
    list
    |> Enum.reduce({:ok, []}, &transform_list_reducer(&1, &2, type))
    |> case do
      {:ok, acc} ->
        {:ok, Enum.reverse(acc)}

      {:error, e} ->
        {:error, e}
    end
  end

  defp transform_list(list, _type) do
    {:error, "Expected list, got #{inspect(list)}"}
  end

  defp transform_list_reducer(item, {:ok, acc}, type) do
    item
    |> transform_value(type)
    |> case do
      {:ok, v} -> {:ok, [v | acc]}
      {:error, e} -> {:error, e}
    end
  end

  defp transform_list_reducer(_, {:error, e}, _) do
    {:error, e}
  end

  defp collapse_union(union_types, value) do
    value_fields =
      value
      |> case do
        v when v |> is_map -> v
        _ -> %{}
      end
      |> Map.keys()
      |> Enum.join("")

    union_types
    |> Enum.find(fn
      {:enum, values} ->
        Enum.member?(values, value)

      {struct, type} ->
        struct_fields = struct.__fields__(type)

        struct_fields
        |> Enum.find(fn {field, _} -> field == :type end)
        |> struct_matches?(value, {struct_fields, value_fields})
    end)
  end

  defp struct_matches?({:type, {:enum, values}}, %{"type" => t}, _), do: Enum.member?(values, t)

  defp struct_matches?({:type, {:enum, values}}, v, _) when v |> is_binary,
    do: Enum.member?(values, v)

  defp struct_matches?({:type, {:enum, _values}}, _, _), do: false
  defp struct_matches?({:type, {:const, type}}, %{"type" => t}, _), do: t == type
  defp struct_matches?({:type, {:const, type}}, v, _) when v |> is_binary, do: v == type
  defp struct_matches?({:type, {:const, _type}}, _, _), do: false

  defp struct_matches?(_, _, {struct_fields, value_fields}) do
    struct_fields
    |> Enum.reduce("", fn {field, _}, acc -> acc <> (field |> Atom.to_string()) end)
    |> Kernel.==(value_fields)
  end
end
