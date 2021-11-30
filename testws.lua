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