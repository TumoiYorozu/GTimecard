#! /usr/bin/env ruby
require "time"
require 'date'

working_file = ".working"
comment_file = ".comment"

if not File.exist?(working_file) then
  print("\033[40m\033[1;34mWoring!! NOW Working!!! 現在働いていません\033[0m\n")
end
if File.exist?(comment_file) then
  com=File.read(comment_file)
  print("現在のコメント:\n",com,"\n")
end

print("新しいコメント:\n");

com=""

while str = STDIN.gets
  break if str.chomp == "exit"
  com += str
end
com=com.chomp

File.write(comment_file, com)

print("コメントを更新しました\n", com,"\n")
