require 'rails_helper'

RSpec.describe 'User sends an SMS Message', type: :feature do
  context 'when sending to a valid number' do
    it 'shows a success message' do
      match_twilio_uri
      VCR.use_cassette(
        'send_sms',
        allow_playback_repeats: true,
        match_requests_on: %i[method uri]
      ) do
        visit '/'
        within '#smsForm' do
          fill_in 'to', with: '+12223334444'
          fill_in 'body', with: 'Hello'
          click_button 'Send Message'
        end
        dialog_title = find_by_id('dialogTitle')
        expect(dialog_title).to have_text('SMS Sent!')
        dialog = find_by_id('dialog')
        expect(dialog[:class]).to include('alert-success')
        expect(dialog[:class]).not_to include('d-none')
        expect(page).to have_text('SMS sent to +12223334444.')
      end
    end
  end

  context 'when sending to an invalid number' do
    it 'shows an error message' do
      match_twilio_uri
      VCR.use_cassette(
        'invalid_request',
        allow_playback_repeats: true,
        match_requests_on: %i[method uri]
      ) do
        visit '/'
        within '#smsForm' do
          fill_in 'to', with: '+1111'
          fill_in 'body', with: 'Hello'
          click_button 'Send Message'
        end
        dialog_title = find_by_id('dialogTitle')
        expect(dialog_title).to have_text('Error')
        dialog = find_by_id('dialog')
        expect(dialog[:class]).to include('alert-danger')
        expect(dialog[:class]).not_to include('d-none')
        expect(page).to have_text('Failed to send SMS.')
      end
    end
  end
end
