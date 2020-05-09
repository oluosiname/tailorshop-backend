# frozen_string_literal: true

class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: login_params[:email])

    if user&.authenticate(params[:password])
      token = SigninUser.call(user)
      render json: { token: token }, status: 200
    else
      render json: 'Invalid email/password', status: 422
    end
  end

  def destroy
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
