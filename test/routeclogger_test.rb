#!/usr/bin/env ruby

# Route Clogger Tests
# Written by Tate Galbraith
# January 2018

require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../routeclogger'

Minitest::Reporters.use!

class RouteCloggerTest < Minitest::Test

  def test_true
    assert_equal(1, 1)
  end

end
