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
        Response.new(true, [], user, :user)
      end

    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotDestroyed
      Response.new(false, user.errors.full_messages, user)
    end
  end
end