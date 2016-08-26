module Budget
  class Forecast

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

  end
end
