IP2Location Lua Package
======================

This Lua package provides a fast lookup of country, region, city, latitude, longitude, ZIP code, time zone, ISP, domain name, connection type, IDD code, area code, weather station code, station name, mcc, mnc, mobile brand, elevation, and usage type from IP address by using IP2Location database. This package uses a file based database available at IP2Location.com. This database simply contains IP blocks as keys, and other information such as country, region, city, latitude, longitude, ZIP code, time zone, ISP, domain name, connection type, IDD code, area code, weather station code, station name, mcc, mnc, mobile brand, elevation, and usage type as values. It supports both IP address in IPv4 and IPv6.

This package can be used in many types of projects such as:

 - select the geographically closest mirror
 - analyze your web server logs to determine the countries of your visitors
 - credit card fraud detection
 - software export controls
 - display native language and currency 
 - prevent password sharing and abuse of service 
 - geotargeting in advertisement

The database will be updated in monthly basis for the greater accuracy. Free LITE databases are available at https://lite.ip2location.com/ upon registration.

The paid databases are available at https://www.ip2location.com under Premium subscription package.


Installation
=======

```
luarocks install ip2location
```

Example
=======

```lua
ip2location = require('ip2location')

local ip2loc = ip2location:new('IP-COUNTRY-REGION-CITY-LATITUDE-LONGITUDE-ZIPCODE-TIMEZONE-ISP-DOMAIN-NETSPEED-AREACODE-WEATHER-MOBILE-ELEVATION-USAGETYPE.BIN')

local result = ip2loc:get_all('8.8.8.8')

print("country_short: " .. result.country_short)
print("country_long: " .. result.country_long)
print("region: " .. result.region)
print("city: " .. result.city)
print("isp: " .. result.isp)
print("latitude: " .. result.latitude)
print("longitude: " .. result.longitude)
print("domain: " .. result.domain)
print("zipcode: " .. result.zipcode)
print("timezone: " .. result.timezone)
print("netspeed: " .. result.netspeed)
print("iddcode: " .. result.iddcode)
print("areacode: " .. result.areacode)
print("weatherstationcode: " .. result.weatherstationcode)
print("weatherstationname: " .. result.weatherstationname)
print("mcc: " .. result.mcc)
print("mnc: " .. result.mnc)
print("mobilebrand: " .. result.mobilebrand)
print("elevation: " .. result.elevation)
print("usagetype: " .. result.usagetype)

ip2loc:close()

```

Dependencies
============

The complete database is available at https://www.ip2location.com under subscription package.


IPv4 BIN vs IPv6 BIN
====================

Use the IPv4 BIN file if you just need to query IPv4 addresses.
Use the IPv6 BIN file if you need to query BOTH IPv4 and IPv6 addresses.


Copyright
=========

Copyright (C) 2020 by IP2Location.com, support@ip2location.com
