require 'oyster'
describe OysterCard do
  describe '#initialize' do
    it 'has a default of zero' do
      expect(subject.balance).to eq 0
    end
  end
  
  describe '#top_up' do 
    it 'top_up' do
      oyster = OysterCard.new
      oyster.top_up(10)
      expect(oyster.balance).to eq(10)
    end 
    
    it 'adds amount to balance' do
      oyster = OysterCard.new(5)
      oyster.top_up(10)
      expect(oyster.balance).to eq(15)
    end

    it 'has max balance £90' do
      oyster = OysterCard.new(45)
      expect{oyster.top_up(50)}.to raise_error 'exceeded balance of £90'
    end
  end
end