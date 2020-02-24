require 'oyster_stories'
describe OysterCard do
  describe '#initialize' do
    it 'has a default of zero' do
      expect(subject.balance).to eq 0
    end
  end
end