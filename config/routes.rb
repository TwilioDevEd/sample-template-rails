Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'example/index'
  match 'send-sms', to: 'example#send_sms', via: [:post]
  get 'example', to: 'example#example'
  root 'example#index'
end
