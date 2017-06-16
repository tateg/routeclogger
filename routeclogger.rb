#!/usr/bin/env ruby

# Route Clogger
# Written by Tate Galbraith
# June 2017

require 'net/ssh'
require 'ipaddress'
require 'colorize'

# Setup SSH session and execute commands from commands array
def run_ssh(host, user, password, address_objects)
  Net::SSH.start("#{host}", "#{user}", :password => "#{password}") do |ssh|
    ssh.exec("\n")
    sleep 1
    ssh.exec("\n")
    sleep 1
    ssh.exec("en\n")
    sleep 1
    ssh.exec("conf t\n")
    address_objects.each do |address_object|
      @subnet = address_object.address
      @mask = address_object.netmask
      ssh.exec("ip route #{@subnet} #{@mask} null 0")
    end
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
