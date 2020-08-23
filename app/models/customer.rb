# frozen_string_literal: true

class Customer < ApplicationRecord
  include Uuidable

  paginates_per 12
  max_paginates_per 30

  belongs_to :partner
  has_many :addresses, as: :addressable

  def address
    primary_address&.full_address || addresses.last.full_address
  end

  def user_id
    nil
  end

  private

  def primary_address
    addresses.where(primary: true).last
  end
end
