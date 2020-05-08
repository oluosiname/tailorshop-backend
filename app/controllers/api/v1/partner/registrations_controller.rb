# frozen_string_literal: true

class Api::V1::Partner::RegistrationsController < ApplicationController
  def create
    user = User.new(signup_params.except(:company))
    result = UserCreator::Partner.call(user, signup_params[:company])

    if result.success?
      token = SigninUser.call(result.user)
      render json: { token: token }, status: 201
    else
      render json: result.errors, status: 422
    end
  end

  private

  def signup_params
    params.require(:user).permit(:email, :password, :company)
  end
end
