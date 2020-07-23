# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  def show
    render json: { user: @current_user }
  end
end
