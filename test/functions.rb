#!/usr/bin/env ruby
require "rtruckboris"
#require File.dirname(__FILE__) + "/../lib/rtruckboris"

parser = Rtruckboris::HeaderParser.new("./test_cpp", ["/usr/include"])
parser.parse

functions = parser.functions()
puts "Functions number : #{functions.size}"
functions.each do |f|
  puts "Name : #{f.name}"
  puts "Return : #{f.return_type.name}"
  params = f.parameters
  puts "\t #{params.size.to_s} parameters :"
  params.each do |p|
   puts "\t\t#{p.type.name}  #{p.name}"
    if(!p.type.is_canonical)
      puts "\t\t\t#{p.type.canonical_type.name}"
    end
  end
end

functions.each do |f|
  puts f.raw(parser.source_manager,parser.lang_opts)
end
