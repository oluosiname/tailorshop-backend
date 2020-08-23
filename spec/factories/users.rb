# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    factory :partner_user, class: User do
      after(:create) do |user, _evaluator|
        create(:partner, user_id: user.id)
      end
    end
  end
end
