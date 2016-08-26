module Budget
  class Day
    attr_accessor :day

    def initialize day=Date.today
      @day = day
      @cash_value = 30
      @bonus_multiplier = 2
      @buffer_multiplier = 0.10
    end

    def cash
      @cash_value
    end

    def bonus
      @day.friday? ? @cash_value * @bonus_multiplier : 0
    end

    def buffer
      @cash_value * @buffer_multiplier
    end
  end
end

