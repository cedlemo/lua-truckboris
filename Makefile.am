MAINTAINERCLEANFILES = \
Makefile.in aclocal.m4 config.h.in configure \
depcomp install-sh missing compile config.sub \
config.guess ltmain.sh compile

lib_LTLIBRARIES = src/wrap.la
src_wrap_la_SOURCES = src/wrap.cxx
src_wrap_la_LDFLAGS = -module -avoid-version -shared -llua -lm -fPIC -ltruckboris
src_wrap_la_CXXFLAGS = -march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong -fPIC -fvisibility-inlines-hidden -Wall -W -Wno-unused-parameter -Wwrite-strings -Wcast-qual -Wno-missing-field-initializers -pedantic -Wno-long-long -Wno-maybe-uninitialized -Wnon-virtual-dtor -Wno-comment -std=c++11 -ffunction-sections -fdata-sections -O3 -DNDEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -I/usr/include/truckboris


initmoduledir = @libdir@
initmodule_DATA = src/init.lua
