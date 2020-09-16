# frozen_string_literal: true

class Customer < ApplicationRecord
  include Uuidable

  paginates_per 12
  max_paginates_per 30

  belongs_to :partner
  has_many :addresses, as: :addressable

  validates :phone_number, presence: true
  validates :last_name, presence: true

  def address
    return nil unless addresses.present?

    primary_address&.full_address || addresses.last.full_address
  end

  def user_id
    nil
  end

  private

  def primary_address
    addresses.select(&:primary).last
  end
end
