module Budget
  class Month
    require 'active_support/all'

    attr_reader :calendar
    attr_reader :cash_value
    attr_reader :bonus_value

    def initialize day=Date.today
      @calendar = Budget::Calendar.new
    end

    def cash
      c = 0
      @calendar.days.each do |d|
        c += Budget::Day.new(d).cash
      end
      c
    end

    def buffer
      @calendar.days.size * Budget::Day.new().buffer
    end

    def bonus
      b = 0
      @calendar.days.each do |d|
        b += Budget::Day.new(d).bonus
      end
      b
    end

    def total
      cash + buffer + bonus
    end

  end
end
