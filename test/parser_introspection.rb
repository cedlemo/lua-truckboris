#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/../lib/rtruckboris"

classes = Rtruckboris.constants.select {|c| Class === Rtruckboris.const_get(c)}
puts "Classes Names"
classes.each do |c|
  puts "\t#{c}"
end
def print_methods(class_name)
  puts ">>#{class_name.name}"
  class_name.instance_methods(false).each do |m|
    puts "\t#{m}"
  end
end
print_methods(Rtruckboris::Structure)
print_methods(Rtruckboris::Enum)
print_methods(Rtruckboris::Function)
print_methods(Rtruckboris::TagDeclaration)
print_methods(Rtruckboris::Typedef)
print_methods(Rtruckboris::EnumConstant)
print_methods(Rtruckboris::Parameter)
print_methods(Rtruckboris::Field)
print_methods(Rtruckboris::Type)
print_methods(Rtruckboris::HeaderParser)
