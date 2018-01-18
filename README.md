# Route Clogger - Routing command generator!

This application is designed to generate large amounts of subnets for use in Cisco IOS route commands. This makes the process of inputting lots of test routes or null routes easy. You can simply generate them on-screen and copy them or output them to a file.

Initial usage was centered around the need to place a large amount of null routes in a router for propogation over BGP.

## Sample Usage
```
commands = Command.new(networks: Network.new(quantity: 512))
commands.display
```
