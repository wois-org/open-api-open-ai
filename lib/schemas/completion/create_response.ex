defmodule OpenAi.Completion.CreateResponse do
  @moduledoc """
  Provides struct and type for a Completion.CreateResponse
  """

  @type t :: %__MODULE__{
          choices: [OpenAi.Completion.CreateResponse.Choice.t()],
          created: integer,
          id: String.t(),
          model: String.t(),
          object: String.t(),
          system_fingerprint: String.t() | nil,
          usage: OpenAi.Completion.Usage.t() | nil
        }

  defstruct [:choices, :created, :id, :model, :object, :system_fingerprint, :usage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      choices: [{OpenAi.Completion.CreateResponse.Choice, :t}],
      created: :integer,
      id: {:string, :generic},
      model: {:string, :generic},
      object: {:const, "text_completion"},
      system_fingerprint: {:string, :generic},
      usage: {OpenAi.Completion.Usage, :t}
    ]
  end
end
