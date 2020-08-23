# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign out', type: :request do
  describe 'POST api/v1/logout' do
    let(:user) { create(:user) }
    let(:path) { '/api/v1/logout' }
    let(:token) { user.token }
    let(:subject) { post path, headers: { 'Authorization': "Bearer #{token}" } }

    before { sign_in_user(user) }

    it 'logs out user' do
      subject

      expect(response.status).to eq(200)
    end

    it 'updates user with token' do
      expect { subject }.to change { user.reload.token }.to(nil)
    end

    context 'unauthorized' do
      let(:token) { 'bad' }

      it 'returns error' do
        expect { subject }.to_not change { user.reload.token }

        expect(response.status).to eq(401)
      end
    end
  end
end
