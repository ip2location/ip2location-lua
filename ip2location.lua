bn = require("nums.bn")

ip2location = {
  metaok = false,
  databasetype = 0,
  databasecolumn = 0,
  databaseday = 0,
  databasemonth = 0,
  databaseyear = 0,
  ipv4databasecount = 0,
  ipv4databaseaddr = 0,
  ipv6databasecount = 0,
  ipv6databaseaddr = 0,
  ipv4indexed = false,
  ipv6indexed = false,
  ipv4indexbaseaddr = 0,
  ipv6indexbaseaddr = 0,
  ipv4columnsize = 0,
  ipv6columnsize = 0,
  productcode = 0,
  producttype = 0,
  filesize = 0,
  country_position_offset = 0,
  region_position_offset = 0,
  city_position_offset = 0,
  isp_position_offset = 0,
  domain_position_offset = 0,
  zipcode_position_offset = 0,
  latitude_position_offset = 0,
  longitude_position_offset = 0,
  timezone_position_offset = 0,
  netspeed_position_offset = 0,
  iddcode_position_offset = 0,
  areacode_position_offset = 0,
  weatherstationcode_position_offset = 0,
  weatherstationname_position_offset = 0,
  mcc_position_offset = 0,
  mnc_position_offset = 0,
  mobilebrand_position_offset = 0,
  elevation_position_offset = 0,
  usagetype_position_offset = 0,
  addresstype_position_offset = 0,
  category_position_offset = 0,
  district_position_offset = 0,
  asn_position_offset = 0,
  as_position_offset = 0,
  country_enabled = false,
  region_enabled = false,
  city_enabled = false,
  isp_enabled = false,
  domain_enabled = false,
  zipcode_enabled = false,
  latitude_enabled = false,
  longitude_enabled = false,
  timezone_enabled = false,
  netspeed_enabled = false,
  iddcode_enabled = false,
  areacode_enabled = false,
  weatherstationcode_enabled = false,
  weatherstationname_enabled = false,
  mcc_enabled = false,
  mnc_enabled = false,
  mobilebrand_enabled = false,
  elevation_enabled = false,
  usagetype_enabled = false,
  addresstype_enabled = false,
  category_enabled = false,
  district_enabled = false,
  asn_enabled = false,
  as_enabled = false,
}
ip2location.__index = ip2location

ip2locationrecord = {
  country_short = "",
  country_long = "",
  region = "",
  city = "",
  isp = "",
  latitude = 0.0,
  longitude = 0.0,
  domain = "",
  zipcode = "",
  timezone = "",
  netspeed = "",
  iddcode = "",
  areacode = "",
  weatherstationcode = "",
  weatherstationname = "",
  mcc = "",
  mnc = "",
  mobilebrand = "",
  elevation = 0,
  usagetype = "",
  addresstype = "",
  category = "",
  district = "",
  asn = "",
  as = "",
}
ip2locationrecord.__index = ip2locationrecord

local max_ipv4_range = bn(4294967295)
local max_ipv6_range = bn("340282366920938463463374607431768211455")
local from_v4mapped = bn("281470681743360")
local to_v4mapped = bn("281474976710655")
local from_6to4 = bn("42545680458834377588178886921629466624")
local to_6to4 = bn("42550872755692912415807417417958686719")
local from_teredo = bn("42540488161975842760550356425300246528")
local to_teredo = bn("42540488241204005274814694018844196863")

local country_position = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 }
local region_position = { 0, 0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 }
local city_position = { 0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 }
local isp_position = { 0, 3, 0, 5, 0, 7, 5, 7, 0, 8, 0, 9, 0, 9, 0, 9, 0, 9, 7, 9, 0, 9, 7, 9, 9, 9 }
local latitude_position = { 0, 0, 0, 0, 5, 5, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 }
local longitude_position = { 0, 0, 0, 0, 6, 6, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6 }
local domain_position = { 0, 0, 0, 0, 0, 0, 6, 8, 0, 9, 0, 10, 0, 10, 0, 10, 0, 10, 8, 10, 0, 10, 8, 10, 10, 10 }
local zipcode_position = { 0, 0, 0, 0, 0, 0, 0, 0, 7, 7, 7, 7, 0, 7, 7, 7, 0, 7, 0, 7, 7, 7, 0, 7, 7, 7 }
local timezone_position = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 7, 8, 8, 8, 7, 8, 0, 8, 8, 8, 0, 8, 8, 8 }
local netspeed_position = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 11, 0, 11, 8, 11, 0, 11, 0, 11, 0, 11, 11, 11 }
local iddcode_position = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 12, 0, 12, 0, 12, 9, 12, 0, 12, 12, 12 }
local areacode_position = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 13, 0, 13, 0, 13, 10, 13, 0, 13, 13, 13 }
local weatherstationcode_position =
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 14, 0, 14, 0, 14, 0, 14, 14, 14 }
local weatherstationname_position =
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 15, 0, 15, 0, 15, 0, 15, 15, 15 }
local mcc_position = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 16, 0, 16, 9, 16, 16, 16 }
local mnc_position = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 17, 0, 17, 10, 17, 17, 17 }
local mobilebrand_position = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 18, 0, 18, 11, 18, 18, 18 }
local elevation_position = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 19, 0, 19, 19, 19 }
local usagetype_position = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 20, 20, 20 }
local addresstype_position = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 21 }
local category_position = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22, 22 }
local district_position = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23 }
local asn_position = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24 }
local as_position = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25 }

local api_version = "8.7.1"

local modes = {
  countryshort = 0x0000001,
  countrylong = 0x0000002,
  region = 0x0000004,
  city = 0x0000008,
  isp = 0x0000010,
  latitude = 0x0000020,
  longitude = 0x0000040,
  domain = 0x0000080,
  zipcode = 0x0000100,
  timezone = 0x0000200,
  netspeed = 0x0000400,
  iddcode = 0x0000800,
  areacode = 0x0001000,
  weatherstationcode = 0x0002000,
  weatherstationname = 0x0004000,
  mcc = 0x0008000,
  mnc = 0x0010000,
  mobilebrand = 0x0020000,
  elevation = 0x0040000,
  usagetype = 0x0080000,
  addresstype = 0x0100000,
  category = 0x0200000,
  district = 0x0400000,
  asn = 0x0800000,
  as = 0x1000000,
}

modes.all = modes.countryshort
| modes.countrylong
| modes.region
| modes.city
| modes.isp
| modes.latitude
| modes.longitude
| modes.domain
| modes.zipcode
| modes.timezone
| modes.netspeed
| modes.iddcode
| modes.areacode
| modes.weatherstationcode
| modes.weatherstationname
| modes.mcc
| modes.mnc
| modes.mobilebrand
| modes.elevation
| modes.usagetype
| modes.addresstype
| modes.category
| modes.district
| modes.asn
| modes.as

local invalid_address = "Invalid IP address."
local missing_file = "Invalid database file."
local not_supported = "This parameter is unavailable for selected data file. Please upgrade the data file."
local invalid_bin =
"Incorrect IP2Location BIN file format. Please make sure that you are using the latest IP2Location BIN file."
local ipv6_not_supported = "IPv6 address missing in IPv4 BIN."

-- for debugging purposes
local function printme(stuff)
  local inspect = require("inspect")
  print(inspect(stuff))
end

-- read row
local function readrow(myfile, pos, len)
  myfile:seek("set", pos - 1)
  local bytestr = myfile:read(len)
  return bytestr
end

-- read byte
local function readuint8(pos, myfile)
  myfile:seek("set", pos - 1)
  local bytestr = myfile:read(1)
  local value = 0 -- no need BigNum
  if bytestr ~= nil then
    value = string.byte(bytestr)
  end
  return value
end

-- read byte
local function readuint8header(pos, row)
  local pos2 = pos + 1 -- due to index starting with 1
  local bytestr = string.sub(row, pos2, pos2) -- strip 1 byte
  local value = 0 -- no need BigNum
  if bytestr ~= nil then
    value = string.byte(bytestr)
  end
  return value
end

-- read unsigned 32-bit integer
local function readuint32(pos, myfile)
  myfile:seek("set", pos - 1)
  local bytestr = myfile:read(4)
  local value = bn.ZERO
  if bytestr ~= nil then
    value = bn(string.unpack("<I4", bytestr))
  end
  return value
end

-- read unsigned 32-bit integer
local function readuint32header(pos, row)
  local pos2 = pos + 1 -- due to index starting with 1
  local bytestr = string.sub(row, pos2, pos2 + 3) -- strip 4 bytes
  local value = 0 -- no need BigNum
  if bytestr ~= nil then
    value = string.unpack("<I4", bytestr)
  end
  return value
end

-- read unsigned 32-bit integer
local function readuint32row(pos, row)
  local pos2 = pos + 1 -- due to index starting with 1
  local bytestr = string.sub(row, pos2, pos2 + 3) -- strip 4 bytes
  local value = bn.ZERO
  if bytestr ~= nil then
    value = bn(string.unpack("<I4", bytestr))
  end
  return value
end

-- read unsigned 128-bit integer
local function readuint128(pos, myfile)
  myfile:seek("set", pos - 1)
  local bytestr = myfile:read(16)
  local value = bn.ZERO
  if bytestr ~= nil then
    value = bn(string.unpack("<I8", bytestr)) + (bn(string.unpack("<I8", bytestr, 9)) << 64) -- cannot read 16 bytes at once so split into 2
  end
  return value
end

-- read unsigned 128-bit integer
local function readuint128row(pos, row)
  local pos2 = pos + 1 -- due to index starting with 1
  local bytestr = string.sub(row, pos2, pos2 + 15) -- strip 16 bytes
  local value = bn.ZERO
  -- don't use string.unpack here, may have negative number
  if bytestr ~= nil then
    for i = 1, 16, 1 do
      value = value + (bn(string.byte(bytestr, i)) << (8 * (i - 1)))
    end
  end
  return value
end

-- read string
local function readstr(pos, myfile)
  myfile:seek("set", pos)
  local data = myfile:read(256) -- max size of string field + 1 byte for length
  local strlen = 0
  local len = string.sub(data, 1, 1)
  if len ~= nil then
    strlen = string.byte(len)
  end
  local bytestr = string.sub(data, 2, (strlen + 1))
  local value = ""
  if bytestr ~= nil then
    value = bytestr
  end
  return value
end

-- read float
local function readfloatrow(pos, row)
  local pos2 = pos + 1 -- due to index starting with 1
  local bytestr = string.sub(row, pos2, pos2 + 3) -- strip 4 bytes
  local value = 0.0
  if bytestr ~= nil then
    value = string.unpack("f", bytestr)
  end
  return value
end

-- initialize the component with the database path
function ip2location:new(dbpath)
  local x = {}
  setmetatable(x, ip2location) -- make ip2location handle lookup

  local file, err = io.open(dbpath, "rb")
  if file == nil then
    -- error("Couldn't open file: "..err)
    -- printme(x)
    return x
  else
    x.f = file
  end

  local row = readrow(x.f, 1, 64) -- 64-byte header

  x.databasetype = readuint8header(0, row)
  x.databasecolumn = readuint8header(1, row)
  x.databaseyear = readuint8header(2, row)
  x.databasemonth = readuint8header(3, row)
  x.databaseday = readuint8header(4, row)

  x.ipv4databasecount = readuint32header(5, row)
  x.ipv4databaseaddr = readuint32header(9, row)
  x.ipv6databasecount = readuint32header(13, row)
  x.ipv6databaseaddr = readuint32header(17, row)
  x.ipv4indexbaseaddr = readuint32header(21, row)
  x.ipv6indexbaseaddr = readuint32header(25, row)
  x.productcode = readuint8header(29, row)
  x.producttype = readuint8header(30, row)
  x.filesize = readuint32header(31, row)

  -- check if is correct BIN (should be 1 for IP2Location BIN file), also checking for zipped file (PK being the first 2 chars)
  if (x.productcode ~= 1 and x.databaseyear >= 21) or (x.databasetype == 80 and x.databasecolumn == 75) then -- only BINs from Jan 2021 onwards have this byte set
    error(invalid_bin)
  end

  if x.ipv4indexbaseaddr > 0 then
    x.ipv4indexed = true
  end

  if x.ipv6databasecount > 0 and x.ipv6indexbaseaddr > 0 then
    x.ipv6indexed = true
  end

  x.ipv4columnsize = x.databasecolumn * 4 -- 4 bytes each column
  x.ipv6columnsize = 16 + ((x.databasecolumn - 1) * 4) -- 4 bytes each column, except IPFrom column which is 16 bytes

  local dbt = x.databasetype

  -- since both IPv4 and IPv6 use 4 bytes for the below columns, can just do it once here
  if country_position[dbt] ~= 0 then
    x.country_position_offset = (country_position[dbt] - 2) * 4
    x.country_enabled = true
  end
  if region_position[dbt] ~= 0 then
    x.region_position_offset = (region_position[dbt] - 2) * 4
    x.region_enabled = true
  end
  if city_position[dbt] ~= 0 then
    x.city_position_offset = (city_position[dbt] - 2) * 4
    x.city_enabled = true
  end
  if isp_position[dbt] ~= 0 then
    x.isp_position_offset = (isp_position[dbt] - 2) * 4
    x.isp_enabled = true
  end
  if domain_position[dbt] ~= 0 then
    x.domain_position_offset = (domain_position[dbt] - 2) * 4
    x.domain_enabled = true
  end
  if zipcode_position[dbt] ~= 0 then
    x.zipcode_position_offset = (zipcode_position[dbt] - 2) * 4
    x.zipcode_enabled = true
  end
  if latitude_position[dbt] ~= 0 then
    x.latitude_position_offset = (latitude_position[dbt] - 2) * 4
    x.latitude_enabled = true
  end
  if longitude_position[dbt] ~= 0 then
    x.longitude_position_offset = (longitude_position[dbt] - 2) * 4
    x.longitude_enabled = true
  end
  if timezone_position[dbt] ~= 0 then
    x.timezone_position_offset = (timezone_position[dbt] - 2) * 4
    x.timezone_enabled = true
  end
  if netspeed_position[dbt] ~= 0 then
    x.netspeed_position_offset = (netspeed_position[dbt] - 2) * 4
    x.netspeed_enabled = true
  end
  if iddcode_position[dbt] ~= 0 then
    x.iddcode_position_offset = (iddcode_position[dbt] - 2) * 4
    x.iddcode_enabled = true
  end
  if areacode_position[dbt] ~= 0 then
    x.areacode_position_offset = (areacode_position[dbt] - 2) * 4
    x.areacode_enabled = true
  end
  if weatherstationcode_position[dbt] ~= 0 then
    x.weatherstationcode_position_offset = (weatherstationcode_position[dbt] - 2) * 4
    x.weatherstationcode_enabled = true
  end
  if weatherstationname_position[dbt] ~= 0 then
    x.weatherstationname_position_offset = (weatherstationname_position[dbt] - 2) * 4
    x.weatherstationname_enabled = true
  end
  if mcc_position[dbt] ~= 0 then
    x.mcc_position_offset = (mcc_position[dbt] - 2) * 4
    x.mcc_enabled = true
  end
  if mnc_position[dbt] ~= 0 then
    x.mnc_position_offset = (mnc_position[dbt] - 2) * 4
    x.mnc_enabled = true
  end
  if mobilebrand_position[dbt] ~= 0 then
    x.mobilebrand_position_offset = (mobilebrand_position[dbt] - 2) * 4
    x.mobilebrand_enabled = true
  end
  if elevation_position[dbt] ~= 0 then
    x.elevation_position_offset = (elevation_position[dbt] - 2) * 4
    x.elevation_enabled = true
  end
  if usagetype_position[dbt] ~= 0 then
    x.usagetype_position_offset = (usagetype_position[dbt] - 2) * 4
    x.usagetype_enabled = true
  end
  if addresstype_position[dbt] ~= 0 then
    x.addresstype_position_offset = (addresstype_position[dbt] - 2) * 4
    x.addresstype_enabled = true
  end
  if category_position[dbt] ~= 0 then
    x.category_position_offset = (category_position[dbt] - 2) * 4
    x.category_enabled = true
  end
  if district_position[dbt] ~= 0 then
    x.district_position_offset = (district_position[dbt] - 2) * 4
    x.district_enabled = true
  end
  if asn_position[dbt] ~= 0 then
    x.asn_position_offset = (asn_position[dbt] - 2) * 4
    x.asn_enabled = true
  end
  if as_position[dbt] ~= 0 then
    x.as_position_offset = (as_position[dbt] - 2) * 4
    x.as_enabled = true
  end

  x.metaok = true
  -- printme(x)
  return x
end

-- close file and reset
function ip2location:close()
  self.metaok = false
  io.close(self.f)
end

-- get IP type and calculate IP number; calculates index too if exists
function ip2location:checkip(ip)
  local R = { ERROR = 0, IPV4 = 4, IPV6 = 6 }
  if type(ip) ~= "string" then
    return R.ERROR
  end

  -- check for format 1.11.111.111 for ipv4
  local chunks = { ip:match("^(%d+)%.(%d+)%.(%d+)%.(%d+)$") }
  if #chunks == 4 then
    local ipnum = bn.ZERO
    local octet = 0
    for x, v in pairs(chunks) do
      octet = tonumber(v)
      if octet > 255 then
        return R.ERROR
      end
      ipnum = ipnum + (bn(octet) << (8 * (4 - x)))
    end

    local ipindex = 0
    if self.ipv4indexed then
      ipindex = ((ipnum >> 16) << 3):asnumber() + self.ipv4indexbaseaddr
    end
    return R.IPV4, ipnum, ipindex
  end

  -- check for format ::FFFF:1.11.111.111 for ipv4
  local chunks = { ip:match("^%:%:[fF][fF][fF][fF]%:(%d+)%.(%d+)%.(%d+)%.(%d+)$") }
  if #chunks == 4 then
    local ipnum = bn.ZERO
    local octet = 0
    for x, v in pairs(chunks) do
      octet = tonumber(v)
      if octet > 255 then
        return R.ERROR
      end
      ipnum = ipnum + (bn(octet) << (8 * (4 - x)))
    end

    local ipindex = 0
    if self.ipv4indexed then
      ipindex = ((ipnum >> 16) << 3):asnumber() + self.ipv4indexbaseaddr
    end
    return R.IPV4, ipnum, ipindex
  end

  local isIPv6 = false
  local hextets = 8

  if #chunks == 0 then
    -- parse the ipv6 string using the expected pattern
    for hextet in ip:gmatch("[a-fA-F0-9]*") do
      table.insert(chunks, hextet)
    end
    if #chunks > 0 then
      isIPv6 = true
    end
  end

  -- expand the ipv6 address and add zeroes
  if isIPv6 == true then
    for i = 1, #chunks do
      if chunks[i] == "" then
        for j = 1, hextets - (#chunks - 1) - 1 do
          if j == 1 then
            chunks[i] = "0"
          end
          table.insert(chunks, i, "0")
        end
      end
    end
    if chunks[hextets] == "" then
      chunks[hextets] = "0"
    end
  end

  -- DEBUGGING CODE
  -- for key, value in pairs(chunks)
  -- do
  -- print(key, " -- " , value);
  -- end

  if #chunks == 8 then
    local ipnum = bn.ZERO
    local part = 0
    for x, v in pairs(chunks) do
      part = tonumber(v, 16)
      if #v > 0 and part > 65535 then
        return R.ERROR
      end
      ipnum = ipnum + (bn(part) << (16 * (8 - x)))
    end

    local override = 0

    -- special cases which should convert to equivalent IPv4
    if ipnum >= from_v4mapped and ipnum <= to_v4mapped then -- ipv4-mapped ipv6
      override = 1
      ipnum = ipnum - from_v4mapped
    elseif ipnum >= from_6to4 and ipnum <= to_6to4 then -- 6to4
      override = 1
      ipnum = ipnum >> 80
      ipnum2 = ipnum:asnumber() & 0xffffffff
      ipnum = bn(ipnum2) -- convert back to bn
    elseif ipnum >= from_teredo and ipnum <= to_teredo then -- Teredo
      override = 1
      ipnum = ~ipnum
      ipnum2 = ipnum:asnumber() & 0xffffffff
      ipnum = bn(ipnum2) -- convert back to bn
    end

    local ipindex = 0
    if override == 1 then
      if self.ipv4indexed then
        ipindex = ((ipnum >> 16) << 3):asnumber() + self.ipv4indexbaseaddr
      end
      return R.IPV4, ipnum, ipindex
    else
      if self.ipv6indexed then
        ipindex = ((ipnum >> 112) << 3):asnumber() + self.ipv6indexbaseaddr
      end
      return R.IPV6, ipnum, ipindex
    end
  end

  return R.ERROR
end

-- get api version
function ip2location:api_version()
  return api_version
end

-- populate record with message
function ip2locationrecord:loadmessage(mesg)
  local x = {}
  setmetatable(x, ip2locationrecord) -- make ip2locationrecord handle lookup
  x.country_short = mesg
  x.country_long = mesg
  x.region = mesg
  x.city = mesg
  x.isp = mesg
  x.domain = mesg
  x.zipcode = mesg
  x.timezone = mesg
  x.netspeed = mesg
  x.iddcode = mesg
  x.areacode = mesg
  x.weatherstationcode = mesg
  x.weatherstationname = mesg
  x.mcc = mesg
  x.mnc = mesg
  x.mobilebrand = mesg
  x.usagetype = mesg
  x.addresstype = mesg
  x.category = mesg
  x.district = mesg
  x.asn = mesg
  x.as = mesg
  return x
end

local function round(n)
  return math.floor((math.floor(n * 2) + 1) / 2)
end

local function roundup(num, decimalplaces)
  local mult = 10 ^ (decimalplaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

-- main query
function ip2location:query(ipaddress, mode)
  local result = ip2locationrecord:loadmessage(not_supported) -- default message

  -- read metadata
  if self.metaok ~= true then
    local result = ip2locationrecord:loadmessage(missing_file)
    -- printme(result)
    return result
  end

  -- check IP type and return IP number & index (if exists)
  local iptype, ipno, ipindex = self:checkip(ipaddress)

  if iptype == 0 then
    local result = ip2locationrecord:loadmessage(invalid_address)
    -- printme(result)
    return result
  end

  local colsize = 0
  local baseaddr = 0
  local low = 0
  local high = 0
  local mid = 0
  local rowoffset = 0
  local rowoffset2 = 0
  local ipfrom = bn.ZERO
  local ipto = bn.ZERO
  local maxip = bn.ZERO
  local firstcol = 4 -- 4 bytes for IP From
  local fullrow
  local row
  local readlen = 0

  -- printme(self)

  if iptype == 4 then
    baseaddr = self.ipv4databaseaddr
    high = self.ipv4databasecount
    maxip = max_ipv4_range
    colsize = self.ipv4columnsize
  else
    if self.ipv6databasecount == 0 then
      local result = ip2locationrecord:loadmessage(ipv6_not_supported)
      -- printme(result)
      return result
    end
    firstcol = 16 -- 16 bytes for IP From
    baseaddr = self.ipv6databaseaddr
    high = self.ipv6databasecount
    maxip = max_ipv6_range
    colsize = self.ipv6columnsize
  end

  -- reading index
  if ipindex > 0 then
    row = readrow(self.f, ipindex, 8) -- 4 bytes for each IP From/To
    low = readuint32row(0, row):asnumber()
    high = readuint32row(4, row):asnumber()
  end

  if ipno >= maxip then
    ipno = maxip - bn(1)
  end

  while low <= high do
    mid = (low + high) // 2
    rowoffset = baseaddr + (mid * colsize)

    -- reading IP From + whole row + next IP From
    readlen = colsize + firstcol
    fullrow = readrow(self.f, rowoffset, readlen)

    if iptype == 4 then
      ipfrom = readuint32row(0, fullrow)
      ipto = readuint32row(colsize, fullrow)
    else
      ipfrom = readuint128row(0, fullrow)
      ipto = readuint128row(colsize, fullrow)
    end

    if (ipno >= ipfrom) and (ipno < ipto) then
      readlen = colsize - firstcol
      row = string.sub(fullrow, firstcol + 1, (firstcol + readlen + 1)) -- extract the actual row data

      if (mode & modes.countryshort == 1) and (self.country_enabled == true) then
        result.country_short = readstr(readuint32row(self.country_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.countrylong ~= 0) and (self.country_enabled == true) then
        result.country_long = readstr(readuint32row(self.country_position_offset, row):asnumber() + 3, self.f)
      end

      if (mode & modes.region ~= 0) and (self.region_enabled == true) then
        result.region = readstr(readuint32row(self.region_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.city ~= 0) and (self.city_enabled == true) then
        result.city = readstr(readuint32row(self.city_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.isp ~= 0) and (self.isp_enabled == true) then
        result.isp = readstr(readuint32row(self.isp_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.latitude ~= 0) and (self.latitude_enabled == true) then
        result.latitude = roundup(readfloatrow(self.latitude_position_offset, row), 6)
      end

      if (mode & modes.longitude ~= 0) and (self.longitude_enabled == true) then
        result.longitude = roundup(readfloatrow(self.longitude_position_offset, row), 6)
      end

      if (mode & modes.domain ~= 0) and (self.domain_enabled == true) then
        result.domain = readstr(readuint32row(self.domain_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.zipcode ~= 0) and (self.zipcode_enabled == true) then
        result.zipcode = readstr(readuint32row(self.zipcode_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.timezone ~= 0) and (self.timezone_enabled == true) then
        result.timezone = readstr(readuint32row(self.timezone_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.netspeed ~= 0) and (self.netspeed_enabled == true) then
        result.netspeed = readstr(readuint32row(self.netspeed_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.iddcode ~= 0) and (self.iddcode_enabled == true) then
        result.iddcode = readstr(readuint32row(self.iddcode_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.areacode ~= 0) and (self.areacode_enabled == true) then
        result.areacode = readstr(readuint32row(self.areacode_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.weatherstationcode ~= 0) and (self.weatherstationcode_enabled == true) then
        result.weatherstationcode =
        readstr(readuint32row(self.weatherstationcode_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.weatherstationname ~= 0) and (self.weatherstationname_enabled == true) then
        result.weatherstationname =
        readstr(readuint32row(self.weatherstationname_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.mcc ~= 0) and (self.mcc_enabled == true) then
        result.mcc = readstr(readuint32row(self.mcc_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.mnc ~= 0) and (self.mnc_enabled == true) then
        result.mnc = readstr(readuint32row(self.mnc_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.mobilebrand ~= 0) and (self.mobilebrand_enabled == true) then
        result.mobilebrand = readstr(readuint32row(self.mobilebrand_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.elevation ~= 0) and (self.elevation_enabled == true) then
        result.elevation =
        tonumber(readstr(readuint32row(self.elevation_position_offset, row):asnumber(), self.f))
      end

      if (mode & modes.usagetype ~= 0) and (self.usagetype_enabled == true) then
        result.usagetype = readstr(readuint32row(self.usagetype_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.addresstype ~= 0) and (self.addresstype_enabled == true) then
        result.addresstype = readstr(readuint32row(self.addresstype_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.category ~= 0) and (self.category_enabled == true) then
        result.category = readstr(readuint32row(self.category_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.district ~= 0) and (self.district_enabled == true) then
        result.district = readstr(readuint32row(self.district_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.asn ~= 0) and (self.asn_enabled == true) then
        result.asn = readstr(readuint32row(self.asn_position_offset, row):asnumber(), self.f)
      end

      if (mode & modes.as ~= 0) and (self.as_enabled == true) then
        result.as = readstr(readuint32row(self.as_position_offset, row):asnumber(), self.f)
      end
      -- printme(result)

      -- Lua style where you must have "return" as the last statement in a block
      do
        return result
      end
    else
      if ipno < ipfrom then
        high = mid - 1
      else
        low = mid + 1
      end
    end
  end

  -- printme(result)
  return result
end

-- get all fields
function ip2location:get_all(ipaddress)
  return self:query(ipaddress, modes.all)
end

-- get country code
function ip2location:get_country_short(ipaddress)
  return self:query(ipaddress, modes.countryshort)
end

-- get country name
function ip2location:get_country_long(ipaddress)
  return self:query(ipaddress, modes.countrylong)
end

-- get region
function ip2location:get_region(ipaddress)
  return self:query(ipaddress, modes.region)
end

-- get city
function ip2location:get_city(ipaddress)
  return self:query(ipaddress, modes.city)
end

-- get isp
function ip2location:get_isp(ipaddress)
  return self:query(ipaddress, modes.isp)
end

-- get latitude
function ip2location:get_latitude(ipaddress)
  return self:query(ipaddress, modes.latitude)
end

-- get longitude
function ip2location:get_longitude(ipaddress)
  return self:query(ipaddress, modes.longitude)
end

-- get domain
function ip2location:get_domain(ipaddress)
  return self:query(ipaddress, modes.domain)
end

-- get zip code
function ip2location:get_zipcode(ipaddress)
  return self:query(ipaddress, modes.zipcode)
end

-- get time zone
function ip2location:get_timezone(ipaddress)
  return self:query(ipaddress, modes.timezone)
end

-- get net speed
function ip2location:get_netspeed(ipaddress)
  return self:query(ipaddress, modes.netspeed)
end

-- get idd code
function ip2location:get_iddcode(ipaddress)
  return self:query(ipaddress, modes.iddcode)
end

-- get area code
function ip2location:get_areacode(ipaddress)
  return self:query(ipaddress, modes.areacode)
end

-- get weather station code
function ip2location:get_weatherstationcode(ipaddress)
  return self:query(ipaddress, modes.weatherstationcode)
end

-- get weather station name
function ip2location:get_weatherstationname(ipaddress)
  return self:query(ipaddress, modes.weatherstationname)
end

-- get mobile country code
function ip2location:get_mcc(ipaddress)
  return self:query(ipaddress, modes.mcc)
end

-- get mobile network code
function ip2location:get_mnc(ipaddress)
  return self:query(ipaddress, modes.mnc)
end

-- get mobile carrier brand
function ip2location:get_mobilebrand(ipaddress)
  return self:query(ipaddress, modes.mobilebrand)
end

-- get elevation
function ip2location:get_elevation(ipaddress)
  return self:query(ipaddress, modes.elevation)
end

-- get usage type
function ip2location:get_usagetype(ipaddress)
  return self:query(ipaddress, modes.usagetype)
end

-- get address type
function ip2location:get_addresstype(ipaddress)
  return self:query(ipaddress, modes.addresstype)
end

-- get category
function ip2location:get_category(ipaddress)
  return self:query(ipaddress, modes.category)
end

-- get district
function ip2location:get_district(ipaddress)
  return self:query(ipaddress, modes.district)
end

-- get autonomous system number (ASN)
function ip2location:get_asn(ipaddress)
  return self:query(ipaddress, modes.asn)
end

-- get autonomous system (AS)
function ip2location:get_as(ipaddress)
  return self:query(ipaddress, modes.as)
end

return ip2location
