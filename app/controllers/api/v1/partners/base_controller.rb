# frozen_string_literal: true

class Api::V1::Partners::BaseController < ApplicationController
  before_action :set_partner
  attr_reader :partner

  def set_partner
    @partner = current_user.partner
  end
end
