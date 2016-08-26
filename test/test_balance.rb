require 'test_helper'
require 'active_support/all'

context "#Budget::Balance" do
  setup do
    Budget::Balance.new
  end

  context "today" do
    asserts("day") { topic.day.to_s }.equals(Date.today.to_s)
    asserts("calendar.day") { topic.calendar.day.to_s }.equals(Date.today.to_s)
    asserts("month.day") { topic.month.day.to_s }.equals(Date.today.to_s)
    asserts("calendar.days") { topic.calendar.days.map{|d| d.to_s} }.includes(Date.today.to_s)
  end

  context "when 2014/12/22" do
    hookup { topic.day = Date.parse("2014/12/22") }
    asserts("day") { topic.day.to_s }.equals("2014-12-22")
    asserts("calendar.day") { topic.calendar.day.to_s }.equals("2014-12-22")
    asserts("month.day") { topic.month.day.to_s }.equals("2014-12-22")
    asserts("calendar.days") { topic.calendar.days.map{|d| d.to_s} }.includes("2014-12-22")
    asserts("days_elapsed") { topic.days_elapsed.size }.equals(8)
    asserts("days_remaining") { topic.days_remaining.size }.equals(23)
  end

  context "when have $1500 and $500" do
    hookup { topic.day = Date.parse("2014/12/22") }
    hookup { topic.bank = 1500 }
    hookup { topic.cash = 500 }
    asserts("cash") { topic.cash }.equals(500)
    asserts("bank") { topic.bank }.equals(1500)
    asserts("net") { topic.net }.equals(2000)
    asserts("spent") { topic.spent }.equals(324)
    asserts("budgeted") { topic.budgeted }.equals(939)
    asserts("surplus") { topic.surplus }.equals(1061)
    asserts("break_even") { topic.break_even }.equals(86.95652173913044)
    asserts("runway") { topic.runway.size }.equals(53)
  end

end
