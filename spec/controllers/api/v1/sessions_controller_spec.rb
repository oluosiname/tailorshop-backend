# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :request do
  describe 'POST api/v1/login' do
    before do
      allow(ENV).to receive(:[]).with('AUTH_TOKEN_SECRET').and_return('xyz')
    end

    let(:user) { create(:user) }
    let(:path) { '/api/v1/login' }
    let(:params) do
      {
        email: user.email,
        password: user.password
      }
    end

    it 'logs in user' do
      post path, params: params

      expect(response.status).to eq(200)
      expect(json_body['token']).to_not be_empty
    end

    it 'updates user with token' do
      expect { post path, params: params }.to change { user.reload.token }.from(nil)
    end
  end
end
