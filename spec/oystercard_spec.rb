require 'oyster'
describe Oystercard do
  let(:station){ double :station }
  it 'stores the entry station' do
    subject.top_up(5)
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq entry_station

  end
  let(:entry_station){ double :station}
  let(:exit_station){double :station}
  it 'stores exit station' do
    subject.top_up(5)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.exit_station).to eq exit_station
  end
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }
  it "stores a journey" do
    subject.top_up(5)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journeys).to include journey
  end
  

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end
  describe '#top_up' do
    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up maximum_balance
        expect{ subject.top_up 1 }.to raise_error "Maximum balance of 90 exceeded"
    end

    it { is_expected.to respond_to(:top_up).with(1).argument }
  
    it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end

  #describe '#deduct' do
 #   it { is_expected.to respond_to(:deduct).with(1).argument }
  #  
  #  it 'deducts an amount from the balance' do
  #    subject.top_up(20)
  #      expect{ subject.deduct 3}.to change{ subject.balance }.by -3
  #  end
  #end

  describe "#journey" do
    it 'is initially not a journey' do
      expect(subject).not_to be_in_journey
    end
    it "can touch in" do
      subject.top_up(5)
      subject.touch_in(entry_station)
        expect(subject.in_journey?).to eq(true)
    end
    it "can touch out" do
      subject.top_up(5)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
        expect(subject.in_journey?).to eq(false)
    end
  end
  describe "#minumum" do
    it "will not touch in if below minimum amount" do
      expect{ subject.touch_in(entry_station) }.to raise_error "insufficient amount on card"
    end
  end

  it "has an empty list of journeys by default" do
    expect(subject.journeys).to be_empty
  end
  
end