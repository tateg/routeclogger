# Route Clogger - Routing command generator!

This application is designed to generate large amounts of subnets for use in Cisco IOS route commands. This makes the process of inputting lots of test routes or null routes easy. You can simply generate them on-screen and copy them or output them to a file.

Initial usage was centered around the need to place a large amount of null routes in a router for propogation over BGP.

## Defaults
- Default base network: 10.0.0.0/8
- Default command prefix: ip route
- Default command suffix: null 0

## Sample Usage
- The example below will use all default command prefixes and suffixes with a default base subnet of 10.0.0.0/8. It will generate 512 "ip route <address> <netmask> null 0" commands.
```
commands = Command.new(networks: Networks.new(quantity: 512))
commands.display
```
