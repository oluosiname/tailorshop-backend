# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Partner, type: :model do
  describe 'validations' do
    subject { build(:partner) }

    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :name }
  end

  it { have_many :addresses }
end
