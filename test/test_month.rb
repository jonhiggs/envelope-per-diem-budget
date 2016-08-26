require 'test_helper'
require 'active_support/all'

context "#Budget::Month" do
  setup do
    Budget::Month.new()
  end

  context "when 2014/12/22" do
    hookup { topic.calendar.day = Date.parse("2014/12/22") }
    asserts("cash") { topic.cash }.equals(930)
    asserts("buffer") { topic.buffer }.equals(93)
    asserts("bonus") { topic.bonus }.equals(240)
    asserts("total") { topic.total }.equals(1263)
  end

  context "when 2016/03/15" do
    hookup { topic.calendar.day = Date.parse("2014/12/22") }
    asserts("cash") { topic.cash }.equals(930)
    asserts("buffer") { topic.buffer }.equals(93)
    asserts("bonus") { topic.bonus }.equals(240)
    asserts("total") { topic.total }.equals(1263)
  end

end
