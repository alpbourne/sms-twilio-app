Rails.application.routes.draw do
  post 'twilio/sms'

  resources :text_messages, only: [:create, :index]
end
