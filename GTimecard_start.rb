#! /usr/bin/env ruby
require "time"
require 'date'

working_file = ".working"

if File.exist?(working_file) then
  array = []
  open(working_file){|f| array = f.readlines }
  ts=Time.at(array[1].to_i).strftime("%d月%m日(%a)  %H時 %M分 %S秒") 
  print("\033[40m\033[1;31mError!! NOW Working!!! 現在働いている状態です.",ts, "より\033[0m\n")
  exit(1)
end

t = Time.now
File.open(working_file, 'w') {|file|
 file.write t.iso8601+"\n"+t.to_i.to_s
}

print("お仕事開始! 現在:",t.strftime("%m月%d日(%a)  %H時%M分%S秒"),"\n")


