#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/../lib/rtruckboris"

gtk_window = "/usr/include/gtk-3.0/gtk/gtkwindow.h"
headerPaths = `pkg-config --cflags gtk+-3.0`.gsub("-I","").split(" ")
#get gcc include if needed
gccLibBase='/usr/lib/gcc/' << `llvm-config --host-target`.chomp << "/*"
gccLib = Dir.glob(gccLibBase ).sort.last + "/include"
headerPaths << gccLib
headerPaths << "/usr/include"

parser = Rtruckboris::HeaderParser.new(gtk_window, headerPaths)
if(!parser.parse(true))
  puts "Whada fock??"
  exit
end
functions = parser.functions()
puts "Functions number : #{functions.size}"
functions.each do |f|
  puts "Name : #{f.name}"
  puts "Return : #{f.return_type.name}"
  params = f.parameters
  puts "\t #{params.size.to_s} parameters :"
  params.each do |p|
    puts "\t\t#{p.type.name}  #{p.name}"
  end
end
