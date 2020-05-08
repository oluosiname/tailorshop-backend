# frozen_string_literal: true

module UserCreator
  class Partner < ApplicationService
    attr_reader :user, :company_name

    def initialize(user, company_name)
      @user = user
      @company_name = company_name
    end

    def call
      User.transaction do
        user.save!
        user.create_partner!(name: company_name)
        Response::Success.new(user, :user)
      end
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotDestroyed
      Response::Failure.new(user.errors.full_messages)
    end
  end
end
