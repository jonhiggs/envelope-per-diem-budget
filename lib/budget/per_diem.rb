module Budget
  class PerDiem
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

    def balance
      cash_balance + bank_balance
    end

    def cash_today
      cash_on_day
    end

    def cash_on_day relative=0
      day = Date.today+relative
      cost = cash_value
      cost += bonus_value if day.friday?
      cost
    end

    def consumed
      @calendar.elapsed_days
    end

    def runway
      b = self.balance
      d = 0
      until b <= 0
        cost = cash_on_day(d)
        puts "cost is #{cost}"
        b -= cost
        d += 1
      end
      d
    end

  end
end
