defmodule OpenAi.Client.Value do
  @moduledoc """
  Module for transforming values to expected types.
  """
  alias OpenAi.Client

  def transform(v, :integer) when is_integer(v), do: {:ok, v}
  def transform(v, :integer), do: {:error, "Expected integer, got #{inspect(v)}"}
  def transform(v, :number) when is_number(v), do: {:ok, v}
  def transform(v, :number), do: {:error, "Expected number, got #{inspect(v)}"}
  def transform(v, {:string, _type}) when is_binary(v), do: {:ok, v}
  def transform(v, {:string, _type}), do: {:error, "Expected string, got #{inspect(v)}"}
  def transform(v, {:const, const}) when const == v, do: {:ok, v}
  def transform(v, {:const, const}), do: {:error, "Expected const: #{const}, got #{v}"}
  def transform(v, {:enum, values}), do: in_enum(v, values)
  def transform(v, :boolean) when is_boolean(v), do: {:ok, v}
  def transform(v, :boolean), do: {:error, "Expected boolean, got #{inspect(v)}"}
  def transform(v, :map) when is_map(v), do: {:ok, v}
  def transform(v, :map), do: {:error, "Expected map, got #{inspect(v)}"}
  def transform(v, {:union, types}), do: transform(v, collapse_union(types, v))

  def transform(v, {struct, base_type}) when is_map(v),
    do: Client.Struct.transform(v, struct, base_type)

  def transform(v, type) when is_list(v) and is_list(type),
    do: Client.List.transform(v, type |> List.first())

  def transform(v, {:union, types}) when is_list(v) and is_list(types),
    do: Client.List.transform(v, types)

  def transform(v, type),
    do: {:error, "Failed to transform value: #{inspect(v)} to type: #{inspect(type)}"}

  defp in_enum(value, enum) do
    if Enum.member?(enum, value) do
      {:ok, value}
    else
      {:error, "Expected one of #{inspect(enum)}, got #{value}"}
    end
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
