require 'test_helper'
require 'active_support/all'

context "#Budget::PerDiem" do
  setup do
    calendar = Budget::Calendar.new()
    calendar.day = Date.parse("2014/12/22")
    Budget::PerDiem.new(calendar)
  end

  context "when you have no money" do
    asserts("balance") { topic.balance }.equals(0)
    asserts("cash_balance") { topic.cash_balance }.equals(0)
    asserts("bank_balance") { topic.bank_balance }.equals(0)
    asserts("cash_on_day") { topic.cash_on_day }.equals(30)
    asserts("calendar.day.monday?") { topic.calendar.day.monday? }
    asserts("cash_on_day(Date.today)") { topic.cash_on_day(topic.today) }.equals(30)
    asserts("cash_on_day(Date.today + 1.day)") { topic.cash_on_day(topic.today + 1.day) }.equals(30)
    asserts("cash_on_day(Date.today + 2.day)") { topic.cash_on_day(topic.today + 2.day) }.equals(30)
    asserts("cash_on_day(Date.today + 3.day)") { topic.cash_on_day(topic.today + 3.day) }.equals(30)
    asserts("cash_on_day(Date.today + 4.day)") { topic.cash_on_day(topic.today + 4.day) }.equals(90)
    asserts("cash_on_day(Date.today + 5.day)") { topic.cash_on_day(topic.today + 5.day) }.equals(30)
    asserts("cash_on_day(Date.today + 6.day)") { topic.cash_on_day(topic.today + 6.day) }.equals(30)
    asserts("consumed") { topic.consumed }.equals(30)
  end

end
