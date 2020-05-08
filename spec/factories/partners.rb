# frozen_string_literal: true

FactoryBot.define do
  factory :partner do
    name { 'ssss' }
    user { create(:user) }
  end
end
