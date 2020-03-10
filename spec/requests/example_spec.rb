# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Example API', type: :request do
  describe 'GET /' do
    it 'renders the index template' do
      get example_index_url
      expect(response).to be_successful
    end
  end

  describe 'GET /example' do
    it 'returns a valid JSON' do
      get example_url
      expect(response).to be_successful
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'POST /send-sms' do
    context 'when providing a correct phone number' do
      it 'sends an sms message' do
        match_twilio_uri
        VCR.use_cassette('send_sms', match_requests_on: %i[method uri]) do
          post send_sms_url, params: { to: '+12223334444', body: 'Hey' }
          expect(response).to be_successful
          expect(response.body).to include('SMS sent to +12223334444. ' \
            'Message SID: SMXXXXXXXXXXXXXXXXXXXX')
        end
      end
    end

    context 'when providing an incorrect phone number' do
      it 'rejects the request' do
        match_twilio_uri
        VCR.use_cassette(
          'invalid_request',
          match_requests_on: %i[method uri]
        ) do
          post send_sms_url, params: { to: '+1111', body: 'Hey' }
          expect(response).not_to be_successful
          expect(response.body).to include('Failed to send SMS.')
        end
      end
    end
  end
end
