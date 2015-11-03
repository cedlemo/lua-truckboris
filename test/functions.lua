local truckboris = require("truckboris")

local parser = truckboris.HeaderParser()
parser:add_source_file("./test_cpp")
parser:add_search_path("/usr/include")

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

