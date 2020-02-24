#In order to protect my money from theft or loss
#As a customer
#I want a maximum limit (of £90) on my card
class OysterCard 
  DEFAULT_BALANCE = 0
  attr_accessor :balance, :value
  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end
  def top_up(value)
    @balance_with_top_up = @balance + value
    fail 'exceeded balance of £90' if exceeded_limit?
    @balance += value
  end
  def exceeded_limit?
    if @balance_with_top_up > 90
      exceeded_limit = true
    else
      exceeded_limit = false
    end
  end
end
