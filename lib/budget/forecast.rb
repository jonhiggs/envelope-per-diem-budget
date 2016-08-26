module Budget
  class Forecast

    # with a balance of n, analyse stuff

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
