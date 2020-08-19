# frozen_string_literal: true

class Customer < ApplicationRecord
  include Uuidable

  belongs_to :partner
  has_many :addresses, as: :addressable
end
