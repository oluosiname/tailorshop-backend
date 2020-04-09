require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'callbacks' do
    describe '#create_partner' do
      let(:user) { create(:user) }

      it 'creates a new partner' do
        expect { user.create_partner! }.to change { Partner.count }.by(1)
        expect(Partner.last.user).to eq(user)
      end
    end
  end
end
