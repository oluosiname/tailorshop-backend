# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  include Uuidable

  validates :email, presence: true, uniqueness: true

  has_one :partner
  has_one :customer

  def after_login_path
    '/partner/dashboard'
  end
end
