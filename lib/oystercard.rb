class Oystercard
  attr_reader :balance

  LIMIT = 90

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    raise "The limit is £#{LIMIT}" if over_limit?(amount)
    @balance += amount
  end

  def deduct(amount)
    raise "Not enough funds" if balance_empty?(amount)
    @balance -= amount
  end

  def in_journey?
    return @in_use
  end

  private def balance_empty?(amount)
    return amount > @balance
  end

  private def over_limit?(amount)
    return amount > LIMIT
  end

  
end
