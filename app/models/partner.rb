# frozen_string_literal: true

class Partner < ApplicationRecord
  include Uuidable

  belongs_to :user

  has_many :customers, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
