# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    address1 { Faker::Address.street_address }
    address2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state }

    for_customer

    trait :for_customer do
      association(:addressable, factory: :customer)
    end

    trait :for_partner do
      association(:addressable, factory: :partner)
    end
  end
end
