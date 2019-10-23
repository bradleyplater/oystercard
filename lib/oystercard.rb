class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journeys

  LIMIT = 90
  MINIMUM_CHARGE = 1

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise "The limit is £#{LIMIT}" if over_limit?(amount)
    @balance += amount
  end
  
  def touch_in(station)
    raise "Not enough funds" if minimum_balance?
    @in_use = true
    @entry_station = station
  end
  
  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @exit_station = station
    journeys << {entry_station: @entry_station, exit_station: @exit_station}
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private def deduct(amount)
    raise "Not enough funds" if balance_empty?(amount)
    @balance -= amount
  end

  private def minimum_balance?
    return @balance < MINIMUM_CHARGE
  end

  private def balance_empty?(amount)
    return amount > @balance
  end

  private def over_limit?(amount)
    return (@balance + amount) > LIMIT
  end
end