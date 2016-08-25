module Budget
  class Calendar
    require 'date'

    attr_reader :today

    def initialize payday=15
      @today = Date.today
      @payday = payday
    end

    def payday relative_month=0
      month=@today.month
      month += 1 if @today.day > @payday
      month += relative_month
      Date.parse("#{month}/#{@payday}")
    end

    def next_payday
      payday(0)
    end

    def last_payday
      payday(-1)
    end

    def days
      next_payday.mjd - last_payday.mjd
    end

    def remaining_days
      next_payday.mjd - @today.mjd
    end

    def elapsed_days
      @today.mjd - last_payday.mjd
    end
  end
end
