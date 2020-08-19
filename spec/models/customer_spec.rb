# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { have_many :addressables }
end
