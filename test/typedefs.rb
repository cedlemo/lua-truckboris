#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/../lib/rtruckboris"

parser = Rtruckboris::HeaderParser.new("./test_cpp", ["/usr/include"])
parser.parse

typedefs = parser.typedefs()
puts "Typedefs numbers : #{typedefs.size}"
typedefs.each do |t|
  puts "Typedef Name : #{t.name}"
  puts "Typedef Type : #{t.type.name}"
  puts "Typedef is Canonical : #{t.type.is_canonical}"
  puts "Canonical name : #{t.type.canonical_type.name}"
end

typedefs.each do |t|
  puts t.raw(parser.source_manager,parser.lang_opts)
end
