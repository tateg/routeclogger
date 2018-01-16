#!/usr/bin/env ruby

# Route Clogger
# Written by Tate Galbraith
# January 2018

require 'ipaddress'

class Networks
  attr_reader :base_network, :quantity
  
  def initialize(args)
    @base_network = args[:base_network]
    @quantity     = args[:quantity]
  end
  
  def instantiate_base_networks
    IPAddress(base_network)
  end
  
  def split_networks
    instantiate_base_networks / quantity  
  end
  
end

class Command
  attr_reader :prefix, :suffix
  
  def initialize(args)
    @prefix = args[:prefix]
    @suffix = args[:suffix]
  end
  
  
  
end

# Setup bogus subnets for placement in route table
# Use a 10.0.0.0 to begin with because its the largest
# Split the /8 by number entered and create address obj foreach in arr
def create_bogus_routes(quantity)
  @base_net = "10.0.0.0/8"
  @base_net_instance = IPAddress(@base_net)
  @split_net_arr = @base_net_instance / quantity
  return @split_net_arr
end

create_bogus_routes(512).each do |net|
  @address = net.address
  @mask = net.netmask
  puts "ip route #{@address} #{@mask} null 0"
end
