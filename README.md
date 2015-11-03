# lua Truckboris

lua bindings to the truckboris library. (https://github.com/cedlemo/truckboris)


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

