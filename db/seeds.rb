# frozen_string_literal: true

def clean_up
  Address.destroy_all
  Customer.destroy_all
  Partner.destroy_all
  User.destroy_all
end

def create_customers
  partner = Partner.first
  50.times do
    customer = Customer.create(partner_id: partner.id,
                               first_name: Faker::Name.first_name,
                               last_name: Faker::Name.last_name,
                               gender: %w[Male Female].sample,
                               phone_number: Faker::PhoneNumber.phone_number)

    [1, 2, 1, 1, 2, 2, 3, 1, 1].sample.times do
      Address.create(address_params(customer))
    end
  end
end

def address_params(customer)
  {
    address1: Faker::Address.street_address,
    address2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    addressable: customer,
    primary: true
  }
end
