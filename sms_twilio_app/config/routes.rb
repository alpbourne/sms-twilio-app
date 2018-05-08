Rails.application.routes.draw do
  post 'twilio/sms'
  root 'text_messages#index'

  resources :text_messages, only: [:create, :index]
end
