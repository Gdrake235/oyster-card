#In order to protect my money from theft or loss
#As a customer
#I want a maximum limit (of £90) on my card
class OysterCard 
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  attr_accessor :balance, :MAXIMUM_BALANCE
  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end
  def top_up(value)
    @balance_with_top_up = @balance + value
    fail 'exceeded balance of £90' if balance + value > MAXIMUM_BALANCE
    @balance += value
  end
end
