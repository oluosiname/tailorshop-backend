# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Partners::CustomersController, type: :request do
  let(:partner) { create(:partner) }
  let!(:customers) { create_list(:customer, 20, partner: partner) }
  let(:token) { partner.user.token }

  before { sign_in_user(partner.user) }

  describe 'GET api/v1/partner/customers' do
    let(:path) { '/api/v1/partners/customers' }
    let(:subject) { get path, headers: { 'Authorization': "Bearer #{token}" } }

    before { sign_in_user(partner.user) }

    it 'returns paginated partner customers' do
      subject

      expect(json_body['data'].count).to eq(12)
    end

    context 'unauthorized' do
      let(:token) { 'fake' }
      it 'returns unauthorized' do
        subject

        expect(http_status).to eq(401)
      end
    end
  end

  describe 'POST api/v1/partner/customers' do
    let(:path) { '/api/v1/partners/customers' }
    let(:params) do
      {
        customer: {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          phone_number: Faker::PhoneNumber.phone_number,
          gender: %w[Male Female].sample
        }
      }
    end

    let(:subject) { post path, headers: { 'Authorization': "Bearer #{token}" }, params: params }

    it 'creates a new customer for partner' do
      expect { subject }.to change { partner.customers.count }.by(1)
      expect(http_status).to eq(201)
    end

    context 'unauthorized' do
      let(:token) { 'fake' }

      it 'raises unauthorized' do
        expect { subject }.to_not(change { partner.customers.count })
        expect(http_status).to eq(401)
      end
    end
  end
end
