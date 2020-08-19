# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validations' do
    it { validate_presence_of(:address1) }
  end

  it { belong_to :addressable }
end
