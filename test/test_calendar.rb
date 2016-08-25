require 'test_helper'

context "#Budget::Calendar" do
  setup do
    Budget::Calendar.new()
  end

  context "when day is today" do
    asserts("day") { topic.day.to_s }.equals(Date.today.to_s)
  end

  context "when day is 2014/12/22" do
    hookup { topic.day=Date.parse("2014/12/22") }
    asserts("day") { topic.day.to_s }.equals("2014-12-22")
    asserts("next_payday") { topic.next_payday.to_s }.equals("2015-01-15")
    asserts("last_payday") { topic.last_payday.to_s }.equals("2014-12-15")
    asserts("days") { topic.days.size }.equals(31)
    asserts("elapsed_days") { topic.elapsed_days.size }.equals(8)
    asserts("elapsed_days.first") { topic.elapsed_days.first.to_s }.equals("2014-12-15")
    asserts("remaining_days.last") { topic.remaining_days.last.to_s }.equals("2015-01-14")
    asserts("bonus_days") { topic.bonus_days.size }.equals(4)
    asserts("remaining_bonuses") { topic.remaining_bonuses.size }.equals(3)
    denies("bonus_day?") { topic.bonus_day? }
  end

  context "when day is 2016/03/03" do
    hookup { topic.day=Date.parse("2016/03/03") }
    asserts("day") { topic.day.to_s }.equals("2016-03-03")
    asserts("next_payday") { topic.next_payday.to_s }.equals("2016-03-15")
    asserts("last_payday") { topic.last_payday.to_s }.equals("2016-02-15")
    asserts("days") { topic.days.size }.equals(29)
    asserts("remaining_bonuses") { topic.remaining_bonuses.size }.equals(2)
    denies("bonus_day?") { topic.bonus_day? }
  end

  context "when day is 2016/03/13" do
    hookup { topic.day=Date.parse("2016/03/13") }
    asserts("remaining_days") { topic.remaining_days.size }.equals(1)
    asserts("remaining_bonuses") { topic.remaining_bonuses.size }.equals(0)
    denies("bonus_day?") { topic.bonus_day? }
  end

  context "when day is 2016/03/11" do
    hookup { topic.day=Date.parse("2016/03/11") }
    asserts("friday?") { topic.day.friday? }
    asserts("bonus_day?") { topic.bonus_day? }
  end

end
