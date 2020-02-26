class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
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
  def in_journey?
   return  @in_use ? true : false
  end
  def touch_in(station)
    fail "insufficient amount on card" if balance < 1
    @in_use = true
  end
  def touch_out
    deduct(MINIMUM_BALANCE)
    @in_use = false
  end
  private
  def deduct(amount)
    @balance -= amount
  end
end