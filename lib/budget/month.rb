module Budget
  class Month
    require 'active_support/all'

    attr_reader :calendar
    attr_reader :cash_value
    attr_reader :bonus_value

    def initialize calendar
      @calendar = calendar
      @cash_value = 30
      @bonus_value = @cash_value * 2
      @buffer = 0.10
    end

    def cash
      # cash_on_day for each day
    end

    def buffer
      # buffer value * number of days
    end

    def bonus
      # bonus_value * number of bonuses
    end

  end
end
