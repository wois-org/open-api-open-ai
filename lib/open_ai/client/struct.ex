defmodule OpenAi.Client.Struct do
  @moduledoc """
  Module for transforming maps to expected structs.
  """
  alias OpenAi.Client.Value

  def transform(map, struct, base_type)
      when map |> is_map and struct |> is_atom and base_type |> is_atom do
    struct.__fields__(base_type)
    |> Enum.reduce({:ok, struct.__struct__(%{})}, &transform_reducer(&1, &2, map))
  end

  def transform(map, struct, base_type) do
    {:error,
     """
     Some parameters are of incorrect type
     Expected map, got: #{inspect(map)}
     Expected struct(atom) got: #{inspect(struct)}
     Expected base_type(atom) got: #{inspect(base_type)}
     """}
  end

  defp transform_reducer({field, type}, {:ok, acc}, map) do
    map
    |> Map.get(field |> Atom.to_string(), nil)
    |> case do
      nil ->
        # TODO check if field is nullable
        {:ok, acc}

      value ->
        value
        |> Value.transform(type)
        |> case do
          {:ok, v} -> {:ok, Map.put(acc, field, v)}
          {:error, e} -> {:error, "Field #{field} error: " <> e}
        end
    end
  end

  defp transform_reducer(_, {:error, e}, _) do
    {:error, e}
  end
end
