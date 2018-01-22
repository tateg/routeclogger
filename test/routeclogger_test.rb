#!/usr/bin/env ruby

# Route Clogger Tests
# Written by Tate Galbraith
# January 2018

require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../routeclogger'

Minitest::Reporters.use!

class RouteCloggerTest < Minitest::Test

  def setup
  end

  def test_subnet_slicing_quantity
    @networks = Networks.new(quantity: 10)
    assert_equal(@networks.split_networks.count, 10)
  end

end
