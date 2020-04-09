RSpec.describe UserCreator::Partner do
  describe '.call' do
    let(:user) { build(:user) }
    let(:subject) { UserCreator::Partner.call(user) }

    it 'returns a response object' do
      expect(subject).to be_a(Response)
    end

    context 'successful' do
      it 'creates a new user and partner' do
        expect { subject }.to change { User.count }.by(1)
          .and change { Partner.count }.by(1)
      end

      it 'returns success object' do
        expect(subject.success?).to be(true)
      end
    end

    context 'failure' do
      before do
        allow(user).to receive(:create_partner!).and_raise(ActiveRecord::RecordInvalid)
      end

      it 'returns failur object' do
        expect(subject.success?).to be(false)
      end

      it 'does not create a new user' do
        expect { subject }.not_to change { User.count }
      end

      it 'does not create a new partner' do
        expect { subject }.not_to change { Partner.count }
      end
    end
  end
end