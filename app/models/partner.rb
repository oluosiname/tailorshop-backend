# frozen_string_literal: true

class Partner < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true
end
