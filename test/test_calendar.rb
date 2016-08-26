require 'test_helper'

context "#Budget::Calendar" do
  setup do
    Budget::Calendar.new()
  end

  context "when 2014/12/22" do
    hookup { topic.day=Date.parse("2014/12/22") }
    asserts("days.size") { topic.days.size }.equals(31)
    asserts("days.first") { topic.days.first.to_s }.equals("2014-12-15")
    asserts("days.last") { topic.days.last.to_s }.equals("2015-01-14")
    asserts("bonus_days.size") { topic.bonus_days.size }.equals(4)
    asserts("bonus_days.first") { topic.bonus_days.first.to_s }.equals("2014-12-19")
    asserts("bonus_days.last") { topic.bonus_days.last.to_s }.equals("2015-01-09")
  end

  context "when 2016/03/03" do
    hookup { topic.day=Date.parse("2016/03/03") }
    asserts("days.size") { topic.days.size }.equals(29)
    asserts("days.first") { topic.days.first.to_s }.equals("2016-02-15")
    asserts("days.last") { topic.days.last.to_s }.equals("2016-03-14")
    asserts("bonus_days.size") { topic.bonus_days.size }.equals(4)
    asserts("bonus_days.first") { topic.bonus_days.first.to_s }.equals("2016-02-19")
    asserts("bonus_days.last") { topic.bonus_days.last.to_s }.equals("2016-03-11")
  end

end
