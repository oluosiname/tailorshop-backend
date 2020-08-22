# frozen_string_literal: true

class Api::V1::Partners::CustomersController < Api::V1::Partners::BaseController
  def index
    options = {}
    options[:meta] = { total: 2, has_next_page: true }
    customers = partner.customers.includes(:addresses)
    render json: CustomerSerializer.new(customers, options).serializable_hash
  end
end
