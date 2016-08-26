module Budget
  class Calendar
    require 'active_support/all'

    attr_accessor :day

    def initialize day=Date.today
      @day = day
      @pay_day = SETTINGS["pay_day"]
    end

    def days
      (start_of_month..end_of_month).to_a
    end

    def bonus_days
      days.select { |d| d.wday == 5 }
    end

    private
    def pay_day relative_month=0
      relative_month += 1 if @day.day >= @pay_day
      date = @day + relative_month.months
      month = date.month
      year = date.year
      Date.parse("#{year}/#{month}/#{@pay_day}")
    end

    def start_of_month
      pay_day(-1)
    end

    def end_of_month
      pay_day(0) - 1.day
    end

  end
end
