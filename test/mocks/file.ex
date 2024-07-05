defmodule Mocks.File do
  def file(data) do
    %{
      bytes: 139_920,
      created_at: 1_699_061_776,
      filename: "Support FAQ",
      id: "f_abc123",
      object: "file",
      purpose: "fine-tune"
    }
    |> Map.merge(data)
  end

  def create(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> file()
        |> Poison.encode!()
    }
  end

  def delete(data \\ %{}) do
    file = data |> file()

    %HTTPoison.Response{
      status_code: 200,
      body:
        %{
          id: file.id,
          object: "file",
          deleted: true
        }
        |> Poison.encode!()
    }
  end

  def download(data \\ "This is the content of the file.") do
    %HTTPoison.Response{
      status_code: 200,
      body: data
    }
  end

  def list(data \\ [], count \\ 2) do
    data =
      Enum.map(1..count, fn index ->
        file(data |> Enum.at(index - 1, %{}))
      end)

    %HTTPoison.Response{
      status_code: 200,
      body:
        %{
          object: "list",
          data: data
        }
        |> Poison.encode!()
    }
  end

  def get(data \\ %{}) do
    %HTTPoison.Response{
      status_code: 200,
      body:
        data
        |> file()
        |> Poison.encode!()
    }
  end
end
