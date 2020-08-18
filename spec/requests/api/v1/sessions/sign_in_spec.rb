# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign in', type: :request do
  describe 'POST api/v1/login' do
    let(:user) { create(:user) }
    let(:path) { '/api/v1/login' }
    let(:params) do
      {
        email: user.email,
        password: user.password
      }
    end

    before do
      allow(ENV).to receive(:[]).and_call_original
      allow(ENV).to receive(:[]).with('AUTH_TOKEN_SECRET').and_return('xyz')
    end

    it 'logs in user' do
      post path, params: params

      expect(response.status).to eq(200)
      expect(json_body['token']).to_not be_empty
    end

    it 'updates user with token' do
      expect { post path, params: params }.to change { user.reload.token }.from(nil)
    end

    context 'invalid login' do
      it 'return error' do
        params[:password] = 'bad'
        post path, params: params

        expect(response.status).to eq(422)
        expect(json_body['error']).to eq('Invalid email/password')
      end
    end
  end
end
