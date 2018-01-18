#!/usr/bin/env ruby

# Route Clogger - Routing command generator
# Written by Tate Galbraith
# January 2018

require 'ipaddress'

class Networks
  
  attr_reader :base_network, :quantity
  
  def initialize(args)
    @base_network = args.fetch(:base_network, "10.0.0.0/8")
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
  
  attr_reader :prefix, :suffix, :networks
  
  def initialize(args)
    @prefix   = args.fetch(:prefix, "ip route")
    @suffix   = args.fetch(:suffix, "null 0")
    @networks = args[:networks]
  end
  
  def subnets
    networks.split_networks
  end

  def display
    subnets.each { |subnet|
      puts "#{prefix} #{subnet.address} #{subnet.netmask} #{suffix}" }
  end
  
  def generate
    @generated_routes = []
    subnets.each { |subnet|
      @generated_routes.push("#{prefix} #{subnet.address} #{subnet.netmask} #{suffix}") }
    return @generated_routes
  end
  
end
