class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  journey_history = {}
  attr_reader :balance, :entry_station, :exit_station

  def initialize
    @balance = 0
   # @in_use = false
    
  end
  def top_up(amount)
    @balance = @balance + amount
  end
  def top_up(amount)
    fail "Maximum balance of 90 exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end 
  def in_journey?
    !!entry_station
   #return  @in_use ? true : false
  end
  def touch_in(station)
    fail "insufficient amount on card" if balance < MINIMUM_BALANCE
    #@in_use = true
    @entry_station = station
  end
  def touch_out(station)
    deduct(MINIMUM_BALANCE)
   # @in_use = false
    @entry_station = nil
    @exit_station = station
  end
  def station
    @entry_station
  end
  private
  def deduct(amount)
    @balance -= amount
  end
end