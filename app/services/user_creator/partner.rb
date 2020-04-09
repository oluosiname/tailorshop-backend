module UserCreator
  class Partner < ApplicationService
    attr_reader :user

    def initialize(user)
      @user = user
    end

    def call
      User.transaction do
        user.save!
        user.create_partner!
        Response::Success.new(user, :user)
      end

    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotDestroyed
      Response::Failure.new(user.errors.full_messages)
    end
  end
end