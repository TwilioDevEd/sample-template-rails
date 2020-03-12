# frozen_string_literal: true

require 'vcr'

module VcrConfig
  def ignore_host(host)
    VCR.configure do |c|
      c.ignore_hosts host
    end
  end

  def match_twilio_uri
    VCR.configure do |c|
      c.register_request_matcher :uri do |request1, request2|
        request1.uri.match(request2.uri)
      end
    end
  end
end

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = false
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.ignore_localhost = true
  c.ignore_hosts 'github.com', 'chromedriver.storage.googleapis.com'
end

RSpec.configure do |config|
  config.include VcrConfig
end
