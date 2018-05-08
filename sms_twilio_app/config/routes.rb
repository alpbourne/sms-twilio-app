Rails.application.routes.draw do
  get 'twilio/sms'

  resources :text_messages, only: [:create, :index]
end
