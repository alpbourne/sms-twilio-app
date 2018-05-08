class TextMessagesController < ApplicationController
  def index
    @text_message = TextMessage.new
    @text_messages = TextMessage.all
  end

  def create
    @text_message = TextMessage.new
    @text_message.name = params[:text_message][:name]
    @text_message.phone = params[:text_message][:phone]
    @text_message.message = params[:text_message][:message]
    @text_message.save
    if @text_message.save
      client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_token
      client.messages.create(
        from: Rails.application.secrets.twilio_number,
        to: @text_message.phone,
        body: @text_message.message
        )
      # SendSmsJob.send(@text_message)
      # response = Twilio::TwiML::MessagingResponse.new do |r|
      #   r.message body: @text_message.message
      # end
    end
    redirect_to text_messages_path
  end
end
