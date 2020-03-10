# frozen_string_literal: true

Rails.application.routes.draw do
  get 'example/index'
  match 'send-sms', to: 'example#send_sms', via: [:post]
  get 'example', to: 'example#example'
  root 'example#index'
end
