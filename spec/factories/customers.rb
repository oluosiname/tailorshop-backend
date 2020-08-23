# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender { %w[Male Female].sample }
    phone_number { Faker::PhoneNumber.phone_number }
    partner
  end
end
