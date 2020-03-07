# frozen_string_literal: true

class MyTopicConsumer < ApplicationConsumer
  def consume
    puts "*" * 40
    params_batch.each do |message|
      puts "Message payload: #{message.payload}"
      puts message
    end
    puts "*" * 40
  end
end
