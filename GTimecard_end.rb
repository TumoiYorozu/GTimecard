#! /usr/bin/env ruby
require 'google/api_client'
require "yaml"
require "time"
require 'date'

CALENDAR_ID = 'XXXXXXXXXXXXXXXXXXXXXXXXXX@group.calendar.google.com'
Dir.chdir(__dir__)

working_file = ".working"
comment_file = ".comment"
total_time_file=".total_time"
calender_id_file="calender_id.txt"
workername_file="worker_name.txt"

if File.exist?(calender_id_file) then		
  CALENDAR_ID = File.read(calender_id_file).chomp		
else		
  print("\033[40m\033[1;31mError!! ", calender_id_file,"にカレンダー登録してください\033[0m\n")		
  exit(2)		
end		
		
if File.exist?(workername_file) then		
   worker_name = File.read(workername_file).chomp		
else		
  print("\033[40m\033[1;31mError!! ", workername_file,"に名前を登録してください\033[0m\n")		
  exit(3)		
end



if not File.exist?(working_file) then
  print("\033[40m\033[1;31mError!! NOW NOT Working!!! 現在働いていません.\033[0m\n")
  exit(1)
end
array = []
open(working_file){|f| array = f.readlines }
ts=Time.at(array[1].to_i)
t = Time.now
d = t.to_i - ts.to_i
print(ts.strftime("%m月%d日(%a) %H時 %M分 %S秒から"),"\n",t.strftime("%m月%d日(%a) %H時 %M分 %S秒まで "),(d/60).to_s,"分",(d%60).to_s,"秒\n" ) 

com=""
if File.exist?(comment_file) then
  com=File.read(comment_file)
  print("現在のコメント:\n",com,"\n")
end
print("新しい作業内容コメントを書き込みますか？[No/yes]:");
while true do
  s=STDIN.gets
  s=s.chomp
  if (s==""||s[0]=="N" || s[0]=="n")then
    s=false
    break
  elsif  (s[0]=="Y" || s[0]=="y")
    s=true
    break
  end
  printf("[No/yes]");
end

if(s==true) then
  com=""
  while str = STDIN.gets
    break if str.chomp == "exit"
    com += str
  end
  com=com.chomp
end
print("作業コメント:\n",com,"\n")

oauth_yaml = YAML.load_file('.google-api.yaml')
client = Google::APIClient.new
client.authorization.client_id = oauth_yaml["client_id"]
client.authorization.client_secret = oauth_yaml["client_secret"]
client.authorization.scope = oauth_yaml["scope"]
client.authorization.refresh_token = oauth_yaml["refresh_token"]
client.authorization.access_token = oauth_yaml["access_token"]

cal = client.discovered_api('calendar', 'v3')



time_start=ts.iso8601
time_end=t.iso8601
#p time_start
#p time_end

event = {
  'summary' => worker_name,
  'description' => com,
  'start' => {
    'dateTime' => time_start
  },
  'end' => {
    'dateTime' => time_end
  }
}

result = client.execute(:api_method => cal.events.insert,
                        :parameters => {'calendarId' => CALENDAR_ID},
                        :body => JSON.dump(event),
                        :headers => {'Content-Type' => 'application/json'})

if result.status != 200 then
  print("\033[40m\033[1;31mError!! Googleカレンダー登録エラー\nstatus:",result.status.to_s,"\033[0m\n")
  exit(2)
end

tt=0
if File.exist?(total_time_file) then
  tt=File.read(total_time_file)
  tt=tt.to_i
end
tt += d

File.write(total_time_file, tt)

print("お疲れ様でした。 ",(d/3600).to_s,"時間 ",(d/60%60).to_s,"分 ",(d%60).to_s,"秒働きました!\n累計で　　　　　 ",(tt/3600).to_s,"時間 ",(tt/60%60).to_s,"分 ",(tt%60).to_s,"秒働きました!\n")

File.unlink working_file
