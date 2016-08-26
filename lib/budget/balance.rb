module Budget
  class Balance
    require 'active_support/all'

    attr_reader   :day
    attr_reader   :month
    attr_reader   :calendar
    attr_accessor :bank
    attr_accessor :cash

    def initialize bank=0, cash=0, day=Date.today
      @bank = bank
      @cash = cash
      @day=day
      @calendar = Budget::Calendar.new()
      @calendar.day = day
      @month = Budget::Month.new(@calendar.day)
    end

    def day=(day)
      @day = day
      @calendar.day = @day
      @month = Month.new(@calendar.day)
      @month.calendar
    end

    def net
      @cash + @bank
    end

    def budgeted
      c = 0
      days_remaining.each do |d|
        day = Budget::Day.new(d)
        c += day.cash
        c += day.buffer
        c += day.bonus
      end
      c
    end

    def spent
      c = 0
      days_elapsed.each do |d|
        day = Budget::Day.new(d)
        c += day.cash
        c += day.buffer
        c += day.bonus
      end
      c
    end

    def surplus
      net - budgeted
    end

    def break_even
      ( budgeted + surplus ) / days_remaining.size
    end

    def days_elapsed
      @calendar.days.map {|d| d if d <= @day }.compact
    end

    def days_remaining
      @calendar.days.map {|d| d if d > @day }.compact
    end
  end
end
