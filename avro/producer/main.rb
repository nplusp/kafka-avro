# frozen_string_literal: true

require 'avro_turf'
require 'avro_turf/messaging'
require 'waterdrop'

params = { "full_name" => "Jane", "age" => 28, "address" => "123 St.", "nickname" => "yolo" }

# avro = AvroTurf.new(schemas_path: "../schemas/")
# encoded_data = avro.encode(params, schema_name: "person")
# p "Encoded: #{encoded_data}"

avro = AvroTurf::Messaging.new(registry_url: "http://localhost:8081")
encoded_data1 = avro.encode(params, subject: "Person", version: 1)
encoded_data2 = avro.encode(params, subject: "Person", version: 2)

# decoded_data = avro.decode(encoded_data, schema_name: "person")
# p "Decoded: #{decoded_data}"

WaterDrop.setup do |config|
  config.deliver = true
  config.kafka.seed_brokers = %w[kafka://localhost:9092]
end

# WaterDrop::SyncProducer.call(encoded_data, topic: 'person')
WaterDrop::SyncProducer.call(
  encoded_data1,
  topic: 'person',
  headers: { message_subject: 'Person', message_version: 1 }
)
WaterDrop::SyncProducer.call(
  encoded_data2,
  topic: 'person',
  headers: { message_subject: 'Person', message_version: 2 }
)
