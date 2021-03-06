# lua Truckboris

lua bindings to the truckboris library. (https://github.com/cedlemo/truckboris)

```lua
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
```

# Build:

## Standard:

The autotools will detect automaticaly your lua version
and install the library in a path build on the prefix variable.

    ./autogen.sh --prefix=/usr
    make
    sudo make install

The library files will be isntalled in /usr/lib/lua/LUA_VERSION/trucboris.

## Custom directory:

You can still use the *libdir* variable. If your current version of lua
is 5.3 for example:

    ./autogen.sh --libdir=/usr/lib/lua/5.3
    make
    sudo make install


# Clean:

    sudo make uninstall
    make maintainer clean

