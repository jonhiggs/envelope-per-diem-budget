module Budget
  class Day
    attr_accessor :day

    def initialize day=Date.today
      @day = day
      @per_diem = SETTINGS["per_diem"]
      @bonus_multiplier = SETTINGS["bonus_multiplier"]
      @buffer_multiplier =SETTINGS["buffer_multiplier"]

    end

    def cash
      @per_diem
    end

    def bonus
      @day.friday? ? @per_diem * @bonus_multiplier : 0
    end

    def buffer
      @per_diem * @buffer_multiplier
    end

    def cash_total
      cash + bonus
    end

    def total
      cash + bonus + buffer
    end
  end
end

