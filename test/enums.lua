local truckboris = require("truckboris")

local parser = truckboris.HeaderParser()
parser:add_source_file("./test_cpp")
parser:add_search_path("/usr/include")

has_worked = parser:parse()

if has_worked == true then
  print("Parsing has worked")
end

local enums = {}

for i = 1, parser:enums_num(), 1 do
  enums[i] = parser:get_nth_enum(i - 1)
end

for _,e in ipairs(enums) do
  print("Name : " .. e:name() )
  print("\thas name for linkage ? : " .. tostring(e:has_name_for_linkage()))
  print("\thas linkage ? : " .. tostring(e:has_linkage()))
  print("\ttypedef name : " .. e:typedef_name())
  local constants = {}
  for j = 1, e:constants_num(), 1 do
    constants[j] = e:get_nth_enum_constant(j-1)
  end

  for _,c in ipairs(constants) do
    print("\t\tname : ".. c:name() .. " value : " .. c:value())
  end
end

