# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :request do
  before do
    allow(ENV).to receive(:[]).with('AUTH_TOKEN_SECRET').and_return('xyz')
  end

  describe 'POST api/v1/register' do
    let(:path) { '/api/v1/register' }

    context 'partner' do
      let(:params) do
        {
          user: {
            email: Faker::Internet.email,
            password: Faker::Internet.password,
            company: Faker::Internet.name
          }
        }
      end
      let(:subject) { post path, params: params }

      context 'valid params' do
        it 'creates a new user' do
          expect { subject }
            .to change { User.count }.by(1)
                                     .and change { Partner.count }.by(1)
          expect(response.status).to eq(201)
        end

        it 'signs in user and returns token' do
          subject
          expect(json_body['token']).to_not be_empty
        end
      end

      context 'bad params' do
        before do
          params[:user][:password] = ''
          subject
        end

        it 'returns error' do
          expect(response.status).to eq(422)
          expect(JSON.parse(response.body)).to eq(["Password can't be blank"])
        end
      end
    end

    context 'customer' do
      let(:params) do
        {
          user: {
            email: Faker::Internet.email,
            password: Faker::Internet.password
          }
        }
      end
      let(:subject) { post path, params: params }

      context 'valid params' do
        it 'creates a new user' do
          expect { subject }
            .to change { User.count }.by(1)
                                     .and change { Customer.count }.by(1)
          expect(response.status).to eq(201)
        end

        it 'signs in user and returns token' do
          subject
          expect(json_body['token']).to_not be_empty
        end
      end

      context 'bad params' do
        before do
          params[:user][:password] = ''
          subject
        end

        it 'returns error' do
          expect(response.status).to eq(422)
          expect(JSON.parse(response.body)).to eq(["Password can't be blank"])
        end
      end
    end
  end
end
