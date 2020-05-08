# frozen_string_literal: true

module UserCreator
  class Partner < ApplicationService
    attr_reader :user, :partner

    def initialize(user, partner)
      @user = user
      @partner = partner
    end

    def call
      User.transaction do
        user.save!
        user.create_partner!(name: partner[:name])
        Response::Success.new(user, :user)
      end
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotDestroyed
      Response::Failure.new(user.errors.full_messages)
    end
  end
end
