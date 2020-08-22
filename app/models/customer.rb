# frozen_string_literal: true

class Customer < ApplicationRecord
  include Uuidable

  paginates_per 12
  max_paginates_per 30

  belongs_to :partner
  has_many :addresses, as: :addressable

  def address
    addresses.last.full_address
  end
end
