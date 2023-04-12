# IP2Location Lua Package

This Lua package provides a fast lookup of country, region, city, latitude, longitude, ZIP code, time zone, ISP, domain name, connection type, IDD code, area code, weather station code, station name, mcc, mnc, mobile brand, elevation, usage type, address type, IAB category, district, autonomous system number (ASN) and autonomous system (AS) from IP address by using IP2Location database. This package uses a file based database available at IP2Location.com. This database simply contains IP blocks as keys, and other information such as country, region, city, latitude, longitude, ZIP code, time zone, ISP, domain name, connection type, IDD code, area code, weather station code, station name, mcc, mnc, mobile brand, elevation, usage type, address type, IAB category, district, autonomous system number (ASN) and autonomous system (AS) as values. It supports both IP address in IPv4 and IPv6.

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

As an alternative, this library can also call the IP2Location Web Service. This requires an API key. If you don't have an existing API key, you can subscribe for one at the below:

https://www.ip2location.com/web-service/ip2location

## Installation

```
luarocks install ip2location
```

## QUERY USING THE BIN FILE

## Dependencies

This package requires IP2Location BIN data file to function. You may download the BIN data file at
* IP2Location LITE BIN Data (Free): https://lite.ip2location.com
* IP2Location Commercial BIN Data (Comprehensive): https://www.ip2location.com


## IPv4 BIN vs IPv6 BIN

Use the IPv4 BIN file if you just need to query IPv4 addresses.

Use the IPv6 BIN file if you need to query BOTH IPv4 and IPv6 addresses.


## Methods

Below are the methods supported in this package.

|Method Name|Description|
|---|---|
|get_all|Returns the geolocation information in an object.|
|get_country_short|Returns the country code.|
|get_country_long|Returns the country name.|
|get_region|Returns the region name.|
|get_city|Returns the city name.|
|get_isp|Returns the ISP name.|
|get_latitude|Returns the latitude.|
|get_longitude|Returns the longitude.|
|get_domain|Returns the domain name.|
|get_zipcode|Returns the ZIP code.|
|get_timezone|Returns the time zone.|
|get_netspeed|Returns the net speed.|
|get_iddcode|Returns the IDD code.|
|get_areacode|Returns the area code.|
|get_weatherstationcode|Returns the weather station code.|
|get_weatherstationname|Returns the weather station name.|
|get_mcc|Returns the mobile country code.|
|get_mnc|Returns the mobile network code.|
|get_mobilebrand|Returns the mobile brand.|
|get_elevation|Returns the elevation in meters.|
|get_usagetype|Returns the usage type.|
|get_addresstype|Returns the address type.|
|get_category|Returns the IAB category.|
|get_district|Returns the district name.|
|get_asn|Returns the autonomous system number.|
|get_as|Returns the autonomous system.|
|close|Closes BIN file and resets metadata.|

## Usage

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

## QUERY USING THE IP2LOCATION WEB SERVICE

## Methods
Below are the methods supported in this package.

|Method Name|Description|
|---|---|
|open| 3 input parameters:<ol><li>IP2Location API Key.</li><li>Package (WS1 - WS25)</li></li><li>Use HTTPS or HTTP</li></ol> |
|lookup|Query IP address. This method returns an object containing the geolocation info. <ul><li>country_code</li><li>country_name</li><li>region_name</li><li>city_name</li><li>latitude</li><li>longitude</li><li>zip_code</li><li>time_zone</li><li>isp</li><li>domain</li><li>net_speed</li><li>idd_code</li><li>area_code</li><li>weather_station_code</li><li>weather_station_name</li><li>mcc</li><li>mnc</li><li>mobile_brand</li><li>elevation</li><li>usage_type</li><li>address_type</li><li>category</li><li>continent<ul><li>name</li><li>code</li><li>hemisphere</li><li>translations</li></ul></li><li>country<ul><li>name</li><li>alpha3_code</li><li>numeric_code</li><li>demonym</li><li>flag</li><li>capital</li><li>total_area</li><li>population</li><li>currency<ul><li>code</li><li>name</li><li>symbol</li></ul></li><li>language<ul><li>code</li><li>name</li></ul></li><li>idd_code</li><li>tld</li><li>is_eu</li><li>translations</li></ul></li><li>region<ul><li>name</li><li>code</li><li>translations</li></ul></li><li>city<ul><li>name</li><li>translations</li></ul></li><li>geotargeting<ul><li>metro</li></ul></li><li>country_groupings</li><li>time_zone_info<ul><li>olson</li><li>current_time</li><li>gmt_offset</li><li>is_dst</li><li>sunrise</li><li>sunset</li></ul></li><ul>|
|get_credit|This method returns the web service credit balance in an object.|

## Usage

```lua
ip2locationwebservice = require('ip2locationwebservice')

 local apikey = 'YOUR_API_KEY'
local apipackage = 'WS25'
local usessl = true
local lang = 'fr' -- leave blank if no need
local addon = 'continent,country,region,city,geotargeting,country_groupings,time_zone_info' -- leave blank if no need

local ip = '8.8.8.8'
local ws = ip2locationwebservice:open(apikey, apipackage, usessl)

local result = ws:lookup(ip, addon, lang)

if result["response"] == nil then
  print("Error: Unknown error.")
elseif result.response == "OK" then
  -- standard results
  print("response: " .. result.response)
  print("country_code: " .. result.country_code)
  print("country_name: " .. result.country_name)
  print("region_name: " .. result.region_name)
  print("city_name: " .. result.city_name)
  print("latitude: " .. result.latitude)
  print("longitude: " .. result.longitude)
  print("zip_code: " .. result.zip_code)
  print("time_zone: " .. result.time_zone)
  print("isp: " .. result.isp)
  print("domain: " .. result.domain)
  print("net_speed: " .. result.net_speed)
  print("idd_code: " .. result.idd_code)
  print("area_code: " .. result.area_code)
  print("weather_station_code: " .. result.weather_station_code)
  print("weather_station_name: " .. result.weather_station_name)
  print("mcc: " .. result.mcc)
  print("mnc: " .. result.mnc)
  print("mobile_brand: " .. result.mobile_brand)
  print("elevation: " .. result.elevation)
  print("usage_type: " .. result.usage_type)
  print("address_type: " .. result.address_type)
  print("category: " .. result.category)
  print("category_name: " .. result.category_name)
  print("credits_consumed: " .. result.credits_consumed)

  -- continent addon
  if result["continent"] ~= nil then
    print("continent => name: " .. result.continent.name)
    print("continent => code: " .. result.continent.code)
    print("continent => hemisphere: " .. table.concat(result.continent.hemisphere,","))
    if lang ~= '' and result.continent.translations[lang] ~= nil then
      print("continent => translations => " .. lang .. ": " .. result.continent.translations[lang])
    end
  end

  -- country addon
  if result["country"] ~= nil then
    print("country => name: " .. result.country.name)
    print("country => alpha3_code: " .. result.country.alpha3_code)
    print("country => numeric_code: " .. result.country.numeric_code)
    print("country => demonym: " .. result.country.demonym)
    print("country => flag: " .. result.country.flag)
    print("country => capital: " .. result.country.capital)
    print("country => total_area: " .. result.country.total_area)
    print("country => population: " .. result.country.population)
    print("country => idd_code: " .. result.country.idd_code)
    print("country => tld: " .. result.country.tld)
    print("country => is_eu: " .. tostring(result.country.is_eu))
    if lang ~= '' and result.country.translations[lang] ~= nil then
      print("country => translations => " .. lang .. ": " .. result.country.translations[lang])
    end

    print("country => currency => code: " .. result.country.currency.code)
    print("country => currency => name: " .. result.country.currency.name)
    print("country => currency => symbol: " .. result.country.currency.symbol)

    print("country => language => code: " .. result.country.language.code)
    print("country => language => name: " .. result.country.language.name)
  end

  -- region addon
  if result["region"] ~= nil then
    print("region => name: " .. result.region.name)
    print("region => code: " .. result.region.code)
    if lang ~= '' and result.region.translations[lang] ~= nil then
      print("region => translations => " .. lang .. ": " .. result.region.translations[lang])
    end
  end

  -- city addon
  if result["city"] ~= nil then
    print("city => name: " .. result.city.name)
    if lang ~= '' and result.city.translations[lang] ~= nil then
      print("city => translations => " .. lang .. ": " .. result.city.translations[lang])
    end
  end

  -- geotargeting addon
  if result["geotargeting"] ~= nil then
    print("geotargeting => metro: " .. result.geotargeting.metro)
  end

  -- country_groupings addon
  if result["country_groupings"] ~= nil then
    for i,v in ipairs(result.country_groupings) do
      print("country_groupings => #" .. i .. " => acronym: " .. result.country_groupings[i].acronym)
      print("country_groupings => #" .. i .. " => name: " .. result.country_groupings[i].name)
    end
  end

  -- time_zone_info addon
  if result["time_zone_info"] ~= nil then
    print("time_zone_info => olson: " .. result.time_zone_info.olson)
    print("time_zone_info => current_time: " .. result.time_zone_info.current_time)
    print("time_zone_info => gmt_offset: " .. result.time_zone_info.gmt_offset)
    print("time_zone_info => is_dst: " .. result.time_zone_info.is_dst)
    print("time_zone_info => sunrise: " .. result.time_zone_info.sunrise)
    print("time_zone_info => sunset: " .. result.time_zone_info.sunset)
  end

  local result2 = ws:get_credit()
  print("Credit Balance: " .. result2.response)
else
  print("Error: " .. result.response)
end
```