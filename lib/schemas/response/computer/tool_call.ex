defmodule OpenAi.Response.Computer.ToolCall do
  @moduledoc """
  Provides struct and type for a Response.Computer.ToolCall
  """

  @type t :: %__MODULE__{
          action:
            OpenAi.Response.Computer.Click.t()
            | OpenAi.Response.Computer.DoubleClick.t()
            | OpenAi.Response.Computer.Drag.t()
            | OpenAi.Response.Computer.KeyPress.t()
            | OpenAi.Response.Computer.Move.t()
            | OpenAi.Response.Computer.Screenshot.t()
            | OpenAi.Response.Computer.Scroll.t()
            | OpenAi.Response.Computer.Type.t()
            | OpenAi.Response.Computer.Wait.t(),
          call_id: String.t(),
          id: String.t(),
          pending_safety_checks: [OpenAi.Response.Computer.ToolCall.SafetyCheck.t()],
          status: String.t(),
          type: String.t()
        }

  defstruct [:action, :call_id, :id, :pending_safety_checks, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      action:
        {:union,
         [
           {OpenAi.Response.Computer.Click, :t},
           {OpenAi.Response.Computer.DoubleClick, :t},
           {OpenAi.Response.Computer.Drag, :t},
           {OpenAi.Response.Computer.KeyPress, :t},
           {OpenAi.Response.Computer.Move, :t},
           {OpenAi.Response.Computer.Screenshot, :t},
           {OpenAi.Response.Computer.Scroll, :t},
           {OpenAi.Response.Computer.Type, :t},
           {OpenAi.Response.Computer.Wait, :t}
         ]},
      call_id: {:string, :generic},
      id: {:string, :generic},
      pending_safety_checks: [{OpenAi.Response.Computer.ToolCall.SafetyCheck, :t}],
      status: {:enum, ["in_progress", "completed", "incomplete"]},
      type: {:const, "computer_call"}
    ]
  end
end
