# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::AddressesController, type: :request do
  let(:partner) { create(:partner) }
  let(:customer) { create(:customer, partner: partner) }
  let!(:partner_addresses) { create_list(:address, 5, :for_partner, addressable: partner) }
  let!(:customer_addresses) { create_list(:address, 3, addressable: customer) }
  let(:token) { partner.user.token }

  before { sign_in_user(partner.user) }

  describe 'GET api/v1/addresses' do
    let(:path) { '/api/v1/addresses' }
    let(:params) { {} }
    let(:subject) { get path, headers: { 'Authorization': "Bearer #{token}" }, params: params }

    before { sign_in_user(partner.user) }

    it 'returns addresses for logged in user' do
      subject
      expect(json_body['data'].count).to eq(5)
      expect(json_body['data'].map { |d| d['id'] }).to eq(partner_addresses.map(&:uuid))
    end

    context 'params customer_id present' do
      let(:params) { { customer_id: customer.uuid } }

      it 'returns customer addresses for partner' do
        subject

        expect(json_body['data'].count).to eq(3)
        expect(json_body['data'].map { |d| d['id'] }).to eq(customer_addresses.map(&:uuid))
      end
    end

    context 'unauthorized' do
      let(:token) { 'fake' }
      it 'returns unauthorized' do
        subject

        expect(http_status).to eq(401)
      end
    end
  end

  describe 'PATCH api/v1/addresses/:id' do
    let(:address) { partner_addresses.first }
    let(:path) { "/api/v1/addresses/#{address.uuid}" }
    let(:params) do
      {
        address: {
          primary: true
        }
      }
    end
    let(:subject) { patch path, headers: { 'Authorization': "Bearer #{token}" }, params: params }

    it 'updates address' do
      expect { subject }.to change { address.reload.primary }.from(false).to(true)
      expect(http_status).to eq(200)
    end

    context 'address does not belong to user' do
      let(:address) { create(:address) }

      it 'raises unauthorized' do
        expect { subject }.to_not(change { address.reload.primary })
        expect(http_status).to eq(401)
      end
    end
  end

  describe 'DELETE api/v1/addresses/:id' do
    let(:address) { partner_addresses.first }
    let(:path) { "/api/v1/addresses/#{address.uuid}" }

    let(:subject) { delete path, headers: { 'Authorization': "Bearer #{token}" }}

    it 'deletes address' do
      expect { subject }.to change { partner.reload.addresses.count }.by(-1)
      expect(http_status).to eq(200)
    end

    context 'address does not belong to user' do
      let(:address) { create(:address) }

      it 'raises unauthorized' do
        expect { subject }.to_not(change { partner.reload.addresses.count })
        expect(http_status).to eq(401)
      end
    end
  end
end
