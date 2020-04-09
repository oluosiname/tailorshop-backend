RSpec.describe Response::Failure do
  describe '.call' do
    let(:subject) { Response::Failure.new(errors) }
    let(:errors) { ['an error occured'] }

    describe '#success?' do
      it 'returns false' do
        expect(subject.success?).to be false
      end
    end
  end
end