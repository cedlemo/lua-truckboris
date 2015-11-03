#!/usr/bin/env ruby

require "rtruckboris"
#require File.dirname(__FILE__) + "/../lib/rtruckboris"

parser = Rtruckboris::HeaderParser.new("./test_cpp", ["/usr/include"])
parser.parse

structures = parser.structures()
puts "Structures number : #{structures.size}"
structures.each do |s|
  puts "Structure Name : #{s.name}"
  puts "\thas name for linkage ? #{s.has_name_for_linkage}"  
  puts "\thas linkage ? #{s.has_linkage}"  
  puts "\ttypedef name: #{s.typedef_name}"
  fields = s.fields
  puts "\tfield number: #{fields.size}"
  fields.each do |f|
    puts "\t\t #{f.type.name}  #{f.name}"
  end
end

structures.each do |s|
  puts s.raw(parser.source_manager,parser.lang_opts)
end
