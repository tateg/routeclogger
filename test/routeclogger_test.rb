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
    @networks_mock = MiniTest::Mock.new
  end

  def test_command_sends_splits_networks
    @command = Command.new(networks: @networks_mock)
    @networks_mock.expect(:split_networks, Array)
    @command.subnets
    @networks_mock.verify
  end

  def test_subnet_slicing_quantity
    @networks = Networks.new(quantity: 10)
    assert_equal(@networks.split_networks.count, 10)
  end

end
