# frozen_string_literal: true

class Partner < ApplicationRecord
  include Uuidable

  belongs_to :user

  has_many :customers

  validates :name, presence: true, uniqueness: true
end
