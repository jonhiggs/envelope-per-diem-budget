module Budget
  class PerDiem
    require 'active_support/all'

    attr_reader :calendar
    attr_reader :cash_value
    attr_reader :bonus_value
    attr_accessor :cash_balance
    attr_accessor :bank_balance

    def initialize calendar
      @calendar = calendar
      @cash_value = 30
      @bonus_value = @cash_value * 2
      @cash_balance = 0
      @bank_balance = 0
    end

    def today
      calendar.day
    end

    def balance
      cash_balance + bank_balance
    end

    def cash_on_day date=today
      cost = cash_value
      cost += bonus_value if date.friday?
      cost
    end

    def consumed
      calendar.elapsed_days.map { |d| cash_on_day(d) }.reduce(0, :+)
    end

    def runway
      b = balance
      d = today
      r = 0
      until b <= 0
        cost = cash_on_day(d)
        b -= cost
        d += 1.day
        r += 1 if b >= 0
      end
      r
    end

    def monthly_spend
      cost = 0
      calendar.days.each do |d|
        cost += cash_on_day(d)
      end
      cost
    end

    def daily_spend
      monthly_spend / calendar.days.size
    end

  end
end
