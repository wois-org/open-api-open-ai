defmodule OpenAi.Client.List do
  @moduledoc """
  Module for transforming lists to expected types.
  """
  alias OpenAi.Client.Value

  def transform(list, type) when list |> is_list do
    list
    |> Enum.reduce({:ok, []}, &transform_list_reducer(&1, &2, type))
    |> case do
      {:ok, acc} ->
        {:ok, Enum.reverse(acc)}

      {:error, e} ->
        {:error, e}
    end
  end

  def transform(list, _type) do
    {:error, "Expected list, got #{inspect(list)}"}
  end

  defp transform_list_reducer(item, {:ok, acc}, type) do
    item
    |> Value.transform(type)
    |> case do
      {:ok, v} -> {:ok, [v | acc]}
      {:error, e} -> {:error, e}
    end
  end

  defp transform_list_reducer(_, {:error, e}, _) do
    {:error, e}
  end
end
