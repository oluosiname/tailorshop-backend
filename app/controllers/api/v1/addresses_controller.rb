# frozen_string_literal: true

class Api::V1::AddressesController < ApplicationController
  include ApiResponse

  before_action :set_address, only: %i[update destroy]
  before_action :set_addressable, only: :index
  before_action :authorize, only: %i[update destroy]

  def index
    @addresses = @addressable.addresses
    render json: AddressSerializer.new(@addresses).serializable_hash
  end

  def update
    if @address.update(address_params)
      render json: AddressSerializer.new(@address).serialized_json
    else
      error!(@address.errors)
    end
  end

  def destroy
    if @address.destroy
      render :head
    else
      error!(@address.errors)
    end
  end

  private

  def set_addressable
    if params[:customer_id]
      @addressable = current_user.partner.customers.u_find(params[:customer_id])
    end
    @addressable ||= current_user.associated
  end

  def set_address
    @address = Address.u_find(params[:id]) if params[:id]
  end

  def authorize
    return if @address.addressable.user_id == current_user.id
    if current_user.partner? && @address.addressable&.partner_id == current_user.partner.id
      return
    end

    unauthorized!
  end

  def address_params
    params.require(:address).permit(:primary, :address1, :address2, :city, :state)
  end
end
