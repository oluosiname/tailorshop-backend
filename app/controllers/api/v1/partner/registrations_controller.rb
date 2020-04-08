class Api::V1::Partner::RegistrationsController < ApplicationController
  def create
    user = User.new(signup_params)
    if user.save
      render json: { user_id: user.id }, status: 201
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  private

  def signup_params
    params.require(:user).permit(:email, :password)
  end
end
