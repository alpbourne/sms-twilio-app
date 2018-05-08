class SendSmsJob < ActiveJob::Base
  queue_as :default

  def perform(message)
    SMS.new(message.to).send(message.body)
  end
end
