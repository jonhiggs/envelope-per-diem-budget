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
  end

  #context "when 2014/12/22 " do
  #  hookup { topic.calendar.day = Date.parse("2014/12/22") }
  #  asserts("calendar.days.size") { topic.calendar.days.size }.equals(31)
  #  asserts("calendar.bonus_days.size") { topic.calendar.bonus_days.size }.equals(4)
  #  asserts("cash") { topic.cash }.equals(930)
  #  asserts("buffer") { topic.buffer }.equals(93)
  #  asserts("bonus") { topic.bonus }.equals(240)
  #  asserts("total") { topic.total }.equals(1263)
  #end

  #context "when 2016/02/15" do
  #  hookup { topic.calendar.day = Date.parse("2016/02/15") }
  #  asserts("calendar.days.size") { topic.calendar.days.size }.equals(29)
  #  asserts("calendar.bonus_days.size") { topic.calendar.bonus_days.size }.equals(4)
  #  asserts("cash") { topic.cash }.equals(870)
  #  asserts("buffer") { topic.buffer }.equals(87)
  #  asserts("bonus") { topic.bonus }.equals(240)
  #  asserts("total") { topic.total }.equals(1197)
  #end

end
