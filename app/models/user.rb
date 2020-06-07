# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_one :partner
  has_one :customer

  def after_login_path
    return '/partner/dashboard' if partner?
    '/'
  end

  def customer?
    customer.present?
  end

  def partner?
    partner.present?
  end
end
