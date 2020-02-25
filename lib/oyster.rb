class Oystercard
  MAXIMUM_BALANCE = 90
  attr_reader :balance

  def initialize
    @balance = 0
    @in_use = false
    
  end
  def top_up(amount)
    @balance = @balance + amount
  end
  def top_up(amount)
    fail "Maximum balance of 90 exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end
  def deduct(amount)
    @balance -= amount
  end
  def in_journey?
   return  @in_use ? true : false
  end
  def touch_in
    fail "insufficient amount on card" if balance < 1
    @in_use = true
  end
  def touch_out
    @in_use = false
  end
  
end

#it 'can touch_in' do
 # subject.touch_in
 # expect(subject).to be_in_journey
