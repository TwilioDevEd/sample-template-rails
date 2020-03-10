# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ApplicationSystem', type: :system do
  before do
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  end
end
