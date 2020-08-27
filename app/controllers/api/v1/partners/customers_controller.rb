# frozen_string_literal: true

class Api::V1::Partners::CustomersController < Api::V1::Partners::BaseController
  def index
    options = {}
    customers = partner.customers.includes(:addresses).page(params[:page])
    options[:meta] = { has_next_page: customers.next_page.present? }
    render json: CustomerSerializer.new(customers, options).serializable_hash
  end

  def create
    @customer = partner.customers.create(customer_params)
    if @customer.save
      return render json: CustomerSerializer.new(@customer).serialized_json, status: 201
    end

    error!(@customer.errors)
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone_number, :gender)
  end
end
