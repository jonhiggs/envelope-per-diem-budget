module Budget
  class Month
    require 'active_support/all'

    attr_reader :calendar
    attr_reader :day

    def initialize day=Date.today
      @day = day
      @calendar = Budget::Calendar.new(day)
    end

    def day=(day)
      @calendar.day = day
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
