# frozen_string_literal: true

class Api::V1::Partners::CustomersController < Api::V1::Partners::BaseController
  def index
    options = {}
    customers = partner.customers.includes(:addresses).page(params[:page])
    options[:meta] = { has_next_page: customers.next_page.present? }
    render json: CustomerSerializer.new(customers, options).serializable_hash
  end
end
