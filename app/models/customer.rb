# frozen_string_literal: true

class Customer < ApplicationRecord
  include Uuidable

  belongs_to :partner
  has_many :addresses, as: :addressable

  def address
    addresses.last.full_address
  end
end
