module Budget
  class Calendar
    require 'active_support/all'

    attr_accessor :day

    def initialize payday=15
      @day = Date.today
      @payday = payday
    end

    def days
      (start_of_month..end_of_month).to_a
    end

    def bonus_days
      days.select { |d| d.wday == 5 }
    end

    private
    def payday relative_month=0
      relative_month += 1 if @day.day > @payday
      date = @day + relative_month.months
      month = date.month
      year = date.year
      Date.parse("#{year}/#{month}/#{@payday}")
    end

    def start_of_month
      payday(-1)
    end

    def end_of_month
      payday(0) - 1.day
    end

  end
end
