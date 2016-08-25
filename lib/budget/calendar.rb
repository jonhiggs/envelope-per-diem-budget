module Budget
  class Calendar
    require 'active_support/all'

    attr_accessor :day

    def initialize payday=15
      @day = Date.today
      @payday = payday
    end

    def payday relative_month=0
      relative_month += 1 if @day.day > @payday
      date = @day + relative_month.months
      month = date.month
      year = date.year
      Date.parse("#{year}/#{month}/#{@payday}")
    end

    def next_payday
      payday(0)
    end

    def last_payday
      payday(-1)
    end

    def days
      (last_payday..next_payday-1).to_a
    end

    def remaining_days
      (@day+1..next_payday-1).to_a
    end

    def elapsed_days
      (last_payday..@day).to_a
    end

    def bonus_days
      (last_payday..next_payday).to_a.select { |d| d.wday == 5 }
    end

    def remaining_bonuses
      (@day..next_payday).to_a.select { |d| d.wday == 5 }
    end

    def bonus_day?
      @day.friday?
    end
  end
end
