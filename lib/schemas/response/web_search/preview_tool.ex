defmodule OpenAi.Response.WebSearch.PreviewTool do
  @moduledoc """
  Provides struct and type for a Response.WebSearch.PreviewTool
  """

  @type t :: %__MODULE__{
          search_context_size: String.t() | nil,
          type: String.t(),
          user_location: OpenAi.User.ApproximateLocation.t() | nil
        }

  defstruct [:search_context_size, :type, :user_location]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      search_context_size: {:enum, ["low", "medium", "high"]},
      type: {:enum, ["web_search_preview", "web_search_preview_2025_03_11"]},
      user_location: {:union, [{OpenAi.User.ApproximateLocation, :t}, :null]}
    ]
  end
end
