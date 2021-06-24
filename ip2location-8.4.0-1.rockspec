package = "ip2location"
version = "8.4.0-1"
source = {
   url = "git://github.com/ip2location/ip2location-lua.git"
}
description = {
   summary = "IP2Location Lua Package",
   detailed = [[
      This Lua package provides a fast lookup of country, region, city, latitude, longitude, ZIP code,
      time zone, ISP, domain name, connection type, IDD code, area code, weather station code, station name,
      mcc, mnc, mobile brand, elevation, usage type, address type and IAB category from IP address by using
      IP2Location database. This package uses a file based database available at IP2Location.com. This database
      simply contains IP blocks as keys, and other information such as country, region, city, latitude, longitude,
      ZIP code, time zone, ISP, domain name, connection type, IDD code, area code, weather station code, station name,
      mcc, mnc, mobile brand, elevation, usage type, address type and IAB category as values. It supports both
      IP address in IPv4 and IPv6.
   ]],
   homepage = "https://www.ip2location.com/development-libraries/ip2location/lua",
   license = "MIT",
   maintainer = "support@ip2location.com"
}
dependencies = {
   "lua >= 5.3",
   "lua-nums"
}
build = {
   type    = "builtin",
   modules = {
      ["ip2location"] = "ip2location.lua"
   }
}