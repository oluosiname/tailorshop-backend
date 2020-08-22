# frozen_string_literal: true

class Api::V1::Partners::AddressesController < ApplicationController
  before_action :set_customer

  def index
    @addresses = @customer.addresses
    render json: AddressSerializer.new(@addresses).serializable_hash
  end

  private

  def set_customer
    @customer = Customer.u_find(params[:customer_id])
  end
end
