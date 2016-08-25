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
      (last_payday..next_payday-1).to_a
    end

    def remaining_days
      (@today..next_payday-1).to_a
    end

    def elapsed_days
      (last_payday..@today).to_a
    end

    def bonus_days
      (last_payday..next_payday).to_a.select { |d| d.wday == 5 }
    end

    def remaining_bonuses
      (@today..next_payday).to_a.select { |d| d.wday == 5 }.size
    end

    def bonus_day?
      @today.friday?
    end
  end
end
