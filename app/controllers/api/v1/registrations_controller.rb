# frozen_string_literal: true

class Api::V1::RegistrationsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    user = User.new(signup_params.except(:company))

    result = if signup_params[:company].present?
               UserCreator::Partner.call(user, signup_params[:company])
             else
               UserCreator::Customer.call(user, signup_params[:company])
              end

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
