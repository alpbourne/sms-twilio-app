class SMS
  def initialize(to_phone_number)
    @to_phone_number = to_phone_number
  end

  def client
    Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_token
  end

  def send(text_message)
    binding.pry
    client.account.messages.create(
      :messaging_service_sid => Rails.application.secrets.twilio_messaging_service_sid,
      :to => text_message.phone,
      :body => text_message.
    )
  end
end
