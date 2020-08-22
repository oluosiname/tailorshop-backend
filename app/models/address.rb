# frozen_string_literal: true

class Address < ApplicationRecord
  include Uuidable
  belongs_to :addressable, polymorphic: true

  validates :address1, presence: true

  after_save :set_primary, if: :primary_changed_to_true?

  def full_address
    "#{address1}, #{address2}, #{city}, #{state}".gsub(', ,', ',')
  end

  private

  def set_primary
    addressable.addresses.where.not(id: id).update_all(primary: false)
  end

  def primary_changed_to_true?
    saved_changes[:primary] == [false, true]
  end
end
