RSpec.describe AuthToken::Decoder do
  describe '.call' do
    let(:subject) { AuthToken::Decoder.call(token) }
    let(:payload) { { user_id: 3 } }
    let(:token) { AuthToken::Encoder.call(payload) }

    it 'returns encoded payload' do
      with_env({ 'AUTH_TOKEN_SECRET' => 'token' }) do
        expect(subject).to eq(payload.stringify_keys)
        expect(subject).to have_key('exp')
        expect(subject).to have_key('user_id')
        expect(subject['user_id']).to eq(3)

      end
    end

    context 'invalid token' do
      let(:token) { 'invalid token' }

      it 'returns nil' do
        with_env({ 'AUTH_TOKEN_SECRET' => 'token' }) do
          expect(subject).to be_nil
        end
      end
    end
  end
end