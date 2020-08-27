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
      expect(json_body['data'].map { |d| d['id'] }).to match_array(customers.first(12).map(&:uuid))
    end

    context 'unauthorized' do
      let(:token) { 'fake' }
      it 'returns unauthorized' do
        subject

        expect(http_status).to eq(401)
      end
    end
  end
end
