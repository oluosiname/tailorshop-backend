RSpec.describe AuthToken::Encoder do
  describe '.call' do
    let(:payload) { { user_id: 3 } }

    it 'returns encoded payload' do
      with_env({ 'AUTH_TOKEN_SECRET' => 'token' }) do
        expect(AuthToken::Encoder.call(payload)).to_not be_empty
      end
    end
  end
end