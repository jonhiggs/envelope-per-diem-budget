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
    asserts("consumed") { topic.consumed }.equals(300)
    asserts("runway") { topic.runway }.equals(0)
    asserts("monthly_spend") { topic.monthly_spend }.equals(1200)
    asserts("daily_spend") { topic.daily_spend }.equals(45)
  end

  context "when you have $30" do
    hookup { topic.cash_balance=30 }
    asserts("runway") { topic.runway }.equals(1)
  end

  context "when you have $29" do
    hookup { topic.cash_balance=29 }
    asserts("runway") { topic.runway }.equals(0)
  end

  context "when you have $7000" do
    hookup { topic.cash_balance=7000 }
    asserts("runway") { topic.runway }.equals(181)
  end
end
