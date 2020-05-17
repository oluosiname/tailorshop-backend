# frozen_string_literal: true

module UserCreator
  class Customer < ApplicationService
    attr_reader :user

    def initialize(user, _company_name)
      @user = user
    end

    def call
      User.transaction do
        user.save!
        user.create_customer!
        Response::Success.new(user, :user)
      end
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotDestroyed
      Response::Failure.new(user.errors.full_messages)
    end
  end
end
