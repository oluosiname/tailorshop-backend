# frozen_string_literal: true

class Customer < ApplicationRecord
  include Uuidable

  belongs_to :partner
end
