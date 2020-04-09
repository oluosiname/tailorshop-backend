RSpec.describe Response do
  describe '.call' do
    let(:subject) { Response.new(success, errors, result, result_name) }
    let(:success) { true }
    let(:errors) { [] }
    let(:result) { 'result' }
    let(:result_name) { 'result_name' }

    describe '#success?' do
      it 'returns true' do
        expect(subject.success?).to be true
      end

      context 'false' do
        let(:success) { false }

        it 'returns false' do
          expect(subject.success?).to be false
        end
      end
    end

    it 'defines singleton method with result_name' do
      expect(subject.respond_to?(result_name)).to be true
    end
  end
end