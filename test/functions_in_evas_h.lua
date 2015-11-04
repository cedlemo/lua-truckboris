local truckboris = require("truckboris")

function split(str, pat)
  local t = {}  -- NOTE: use {n = 0} in Lua-5.0
  local fpat = "(.-)" .. pat
  local last_end = 1
  local s, e, cap = string.find(str,fpat, 1)
  while s do
    if s ~= 1 or cap ~= "" then
      table.insert(t,cap)
    end
    last_end = e+1
    s, e, cap = string.find(str,fpat, last_end)
  end
  if last_end <= #str then
    cap = string.sub(str,last_end)
    table.insert(t, cap)
  end
  return t
end

function exec_out(cmd)
  local handle = io.popen(cmd)
  local result = string.gsub(handle:read("*a"), "\n", "")
  handle:close()
  return result
end

command_output= string.gsub(exec_out('pkg-config --cflags evas'),"-I","")
header_paths = split(command_output, " ")
evas = "/usr/include/evas-1/Evas.h"

local parser = truckboris.HeaderParser()
parser:add_source_file(evas)
for _,h in ipairs(header_paths) do
  parser:add_search_path(h)
end

has_worked = parser:parse()

if has_worked == true then
  print("Parsing has worked")
end

local functions = {}

for i = 1, parser:functions_num(), 1 do
  functions[i] = parser:get_nth_function(i - 1)
end

for _,f in ipairs(functions) do
  print("Name : " .. f:name() )
  print("\tReturn : " .. f:return_type():name())
  local params = {}
  for j = 1, f:parameters_num(), 1 do
    params[j] = f:get_nth_parameter(j-1)
  end

  for _,p in ipairs(params) do
    print("\t\tParam : ".. p:type():name() .. "  " .. p:name())
  end
end

local structures = {}

for i = 1, parser:structures_num(), 1 do
  structures[i] = parser:get_nth_function(i - 1)
end

for _,s in ipairs(structures) do
  print("Structure Name : " .. s:name() )
  local fields = {}
--  for j = 1, s:fields_num(), 1 do
--    fields[j] = s:get_nth_field(j-1)
--  end
--
--  for _,f in ipairs(fields) do
--    print("\t\tfield : ".. f:type():name() .. "  " .. f:name())
--  end
end
