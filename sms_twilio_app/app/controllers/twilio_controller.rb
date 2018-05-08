class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def sms
    phone = params[:From]
    message = params[:Body]
    name = "Me"
    TextMessage.new(name: name, phone: phone, message: message).save
    # body = helpers.parse_sms(params)
    response = Twilio::TwiML::MessagingResponse.new do |r|
      r.message body: TextMessage.last.message
    end
    render xml: response.to_s
  end
end
