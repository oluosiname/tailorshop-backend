# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_user
  attr_reader :current_user

  def authenticate_user
    # if decoded_auth_token && user_token?
    #   @current_user = User.find_by(id: decoded_auth_token['user_id'])
    # else
    #   render json: 'Unauthorized access', status: 401
    # end
    @current_user = User.first
  end

  private

  def decoded_auth_token
    AuthToken::Decoder.call(token)
  end

  def token
    return unless request.headers['Authorization'].present?

    request.headers['Authorization'].split(' ').last
  end

  def user_token?
    User.find_by(token: token)
  end
end
