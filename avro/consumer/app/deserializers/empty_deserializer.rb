# frozen_string_literal: true

class EmptyDeserializer
  def call(message)
    message.payload
  end
end
