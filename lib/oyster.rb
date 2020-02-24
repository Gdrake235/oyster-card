#In order to keep using public transport
#As a customer
#I want to add money to my card
class OysterCard 
  DEFAULT_BALANCE = 0
  attr_accessor :balance
  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end
  def top_up(value)
    @balance += value
  end
  
end
