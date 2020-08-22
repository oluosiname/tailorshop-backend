# frozen_string_literal: true

class AddressSerializer
  include FastJsonapi::ObjectSerializer
  set_id :uuid
  attributes :uuid, :address1, :address2, :city, :state, :primary
end
