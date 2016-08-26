require 'test_helper'
require 'active_support/all'

context "#Budget::Day" do
  setup do
    Budget::Day.new()
  end

  context "when monday" do
    hookup { topic.day = Date.parse("2014/12/22") }
    asserts("day.monday?") { topic.day.monday? }
    asserts("cash") { topic.cash }.equals(30)
    asserts("buffer") { topic.buffer }.equals(3)
    asserts("bonus") { topic.bonus }.equals(0)
  end

  context "when friday" do
    hookup { topic.day = Date.parse("2014/12/26") }
    asserts("day.friday?") { topic.day.friday? }
    asserts("cash") { topic.cash }.equals(30)
    asserts("buffer") { topic.buffer }.equals(3)
    asserts("bonus") { topic.bonus }.equals(60)
  end

end
