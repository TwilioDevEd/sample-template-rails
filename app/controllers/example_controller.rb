# frozen_string_literal: true

class ExampleController < ApplicationController
  def index
    @title = 'Template App'
  end

  def send_sms
    sid = send_message params[:to], params[:body]
    render json: {
      status: 'success',
      message: "SMS sent to #{params[:to]}. Message SID: #{sid}"
    }
  rescue StandardError => e
    Rails.logger.error e
    render json: {
      status: 'error',
      message: 'Failed to send SMS. Check server logs for more details.',
      cause: e,
      trace: e.backtrace
    }, status: :internal_server_error
  end

  def example
    render json: { example: true }
  end

  private

  def send_message(phone_number, message_text)
    @twilio_number = ENV['TWILIO_PHONE_NUMBER']
    @client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
    )
    message = @client.messages.create(
      from: @twilio_number,
      to: phone_number,
      body: message_text
    )
    message.sid
  end
end
