#!/usr/bin/env ruby

require "rtruckboris"
#require File.dirname(__FILE__) + "/../lib/rtruckboris"

parser = Rtruckboris::HeaderParser.new("./test_cpp", ["/usr/include"])
if (!parser.parse) then 
  puts "Whada fock??"
  exit
end

enums = parser.enums()
puts "Enums number : #{enums.size}"
enums.each do |e|
  puts "Enum Name : #{e.name}"
  puts "\thas name for linkage ? #{e.has_name_for_linkage}"  
  puts "\thas linkage ? #{e.has_linkage}"  
  puts "\ttypedef name: #{e.typedef_name}"
  constants = e.enum_constants
  print "\t\t"
  constants.each do |c|
    print "#{c.name} #{c.value}  "
  end
  puts""
end

enums.each do |e|
  puts e.raw(parser.source_manager, parser.lang_opts)
end
