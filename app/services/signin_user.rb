# frozen_string_literal: true

class SigninUser < ApplicationService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call
    token = AuthToken::Encoder.call({ user_id: user.id })
    user.update(token: token)
    token
  end
end
