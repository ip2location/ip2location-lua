# Quickstart

## Dependencies

This library requires IP2Location BIN database to function. You may
download the BIN database at

-   IP2Location LITE BIN Data (Free): <https://lite.ip2location.com>
-   IP2Location Commercial BIN Data (Comprehensive):
    <https://www.ip2location.com>

## Installation

To install this library:

```
luarocks install ip2location
```

## Sample Codes

### Query geolocation information from BIN database

You can query the geolocation information from the IP2Location BIN database as below:

```lua
ip2location = require('ip2location')

local ip2loc = ip2location:new('IP-COUNTRY-REGION-CITY-LATITUDE-LONGITUDE-ZIPCODE-TIMEZONE-ISP-DOMAIN-NETSPEED-AREACODE-WEATHER-MOBILE-ELEVATION-USAGETYPE-ADDRESSTYPE-CATEGORY-DISTRICT-ASN.BIN')

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
print("addresstype: " .. result.addresstype)
print("category: " .. result.category)
print("district: " .. result.district)
print("asn: " .. result.asn)
print("as: " .. result.as)

ip2loc:close()
```