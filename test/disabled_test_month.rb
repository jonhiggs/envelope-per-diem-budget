require 'test_helper'
require 'active_support/all'

context "#Budget::Month" do
  setup do
    calendar = Budget::Calendar.new()
    Budget::Month.new(calendar)
  end

  context "when the date is 2014/12/22" do
    hookup { topic.calendar.day = Date.parse("2014/12/22") }
    asserts("cash") { topic.cash }.equals(30)
    asserts("buffer") { topic.buffer }.equals(30)
    asserts("bonus") { topic.bonus }.equals(30)
    #asserts("cash_on_day") { topic.cash_on_day }.equals(30)
    #asserts("cash_on_day(Date.today)") { topic.cash_on_day(topic.today) }.equals(30)
    #asserts("cash_on_day(Date.today + 1.day)") { topic.cash_on_day(topic.today + 1.day) }.equals(30)
    #asserts("cash_on_day(Date.today + 2.day)") { topic.cash_on_day(topic.today + 2.day) }.equals(30)
    #asserts("cash_on_day(Date.today + 3.day)") { topic.cash_on_day(topic.today + 3.day) }.equals(30)
    #asserts("cash_on_day(Date.today + 4.day)") { topic.cash_on_day(topic.today + 4.day) }.equals(90)
    #asserts("cash_on_day(Date.today + 5.day)") { topic.cash_on_day(topic.today + 5.day) }.equals(30)
    #asserts("cash_on_day(Date.today + 6.day)") { topic.cash_on_day(topic.today + 6.day) }.equals(30)
  end

end
