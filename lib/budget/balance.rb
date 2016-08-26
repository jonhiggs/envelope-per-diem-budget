module Budget
  class Balance
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
      @month = Month.new(@calendar.day)
    end

    def day=(day)
      @day = day
      @calendar.day = @day
      @month = Month.new(@calendar.day)
    end

    def surplus
      @month.total
    end

    private
    def days_elapsed
      @calendar.days.map {|d| d if d <= Date.today }.compact
    end

    def days_remaining
    end
  end
end
