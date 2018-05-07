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
    redirect_to text_messages_path
  end
end
