# frozen_string_literal: true

class AvroConsumer < ApplicationConsumer
  def consume
    puts "*" * 60

    params_batch.each do |message|
      # puts message
      puts message.headers
      puts message.payload
    end

    puts "*" * 60
  end
end
