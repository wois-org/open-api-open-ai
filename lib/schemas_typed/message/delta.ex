defmodule OpenAi.Message.Delta do
  @moduledoc """
  MessageDeltaObject:
    type: object
    title: Message delta object
    description: |
        Represents a message delta i.e. any changed fields on a message during streaming.
    properties:
        id:
            description: The identifier of the message, which can be referenced in API endpoints.
            type: string
        object:
            description: The object type, which is always `thread.message.delta`.
            type: string
            enum: ["thread.message.delta"]
        delta:
            description: The delta containing the fields that have changed on the Message.
            type: object
            properties:
                role:
                    description: The entity that produced the message. One of `user` or `assistant`.
                    type: string
                    enum: ["user", "assistant"]
                content:
                    description: The content of the message in array of text and/or images.
                    type: array
                    items:
                        oneOf:
                            - $ref: "#/components/schemas/MessageDeltaContentImageFileObject"
                            - $ref: "#/components/schemas/MessageDeltaContentTextObject"
                            - $ref: "#/components/schemas/MessageDeltaContentImageUrlObject"
                        x-oaiExpandable: true
    required:
        - id
        - object
        - delta
    x-oaiMeta:
        name: The message delta object
        beta: true
        example: |
            {
              "id": "msg_123",
              "object": "thread.message.delta",
              "delta": {
                "content": [
                  {
                    "index": 0,
                    "type": "text",
                    "text": { "value": "Hello", "annotations": [] }
                  }
                ]
              }
            }
  """

  @type t :: %__MODULE__{
          id: String.t(),
          object: String.t(),
          delta: OpenAi.Message.Delta.Delta.t()
        }

  defstruct [
    :id,
    :object,
    :delta
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      object: {:const, "thread.message.delta"},
      delta: {OpenAi.Message.Delta.Delta, :t}
    ]
  end
end
