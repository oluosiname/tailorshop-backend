# frozen_string_literal: true

class CustomerSerializer
  include FastJsonapi::ObjectSerializer
  set_id :uuid
  attributes :uuid, :first_name, :last_name, :gender, :phone_number, :address
end
