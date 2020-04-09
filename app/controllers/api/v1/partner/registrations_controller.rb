class Api::V1::Partner::RegistrationsController < ApplicationController
  def create
    user = User.new(signup_params)
    result = UserCreator::Partner.call(user)

    if result.success?
      render json: { user_id: result.user.id }, status: 201
    else
      render json: { errors: result.errors }, status: 422
    end
  end

  private

  def signup_params
    params.require(:user).permit(:email, :password)
  end
end
