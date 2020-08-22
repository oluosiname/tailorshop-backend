# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :address1, presence: true

  def full_address
    "#{address1}, #{address2}, #{city}, #{state}".gsub(', ,', ',')
  end
end
