# frozen_string_literal: true

require 'avro_turf'
require 'avro_turf/messaging'
require_relative "../../../core_ext/avro_turf_messaging"

class AvroDeserializer
  def initialize
    # @avro = AvroTurf.new(schemas_path: "../schemas/")
    @avro = AvroTurf::Messaging.new(registry_url: "http://localhost:8081")
  end

  def call(message)
    # @avro.decode(message.payload)
    @avro.decode(
      message.payload,
      subject: message.headers['message_subject'],
      version: message.headers['message_version']
    )
  end
end
