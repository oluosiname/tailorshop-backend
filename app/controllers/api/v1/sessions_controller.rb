# frozen_string_literal: true

class Api::V1::SessionsController < ApplicationController
  include LoginHelper
  skip_before_action :authenticate_user, only: :create

  def create
    user = User.find_by(email: login_params[:email])

    if user&.authenticate(params[:password])
      token = SigninUser.call(user)
      render json: { token: token, after_login_path: after_login_path(user) },
             status: 200
    else
      render json: { error: 'Invalid email/password' }, status: 422
    end
  end

  def destroy
    current_user.update(token: nil)

    render status: 200
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
