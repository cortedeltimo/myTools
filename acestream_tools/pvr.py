import time
import os
import sys

not_started = 1
not_ended = 1 

channel = sys.argv[1]
start_time = sys.argv[2]
end_time = sys.argv[3]
outfile = sys.argv[4]

if start_time != "now" :
   start_time_h = start_time.split(":")[0]
   start_time_m = start_time.split(":")[1]

end_time_h = end_time.split(":")[0]
end_time_m = end_time.split(":")[1]


print "Recording starting at " + start_time_h + ":" + start_time_m + "\n"
while(not_started):
    dt = list(time.localtime())
    hour = dt[3]
    minute = dt[4]
    if hour == int(start_time_h) and minute == int(start_time_m):
       os.popen2("acestreamplayer " + channel + " --sout \"#file{mux=TS,dst=/home/giuseppe/" + outfile + "}\" --sout-keep 2>&1 > /tmp/acer.log")
       not_started = 0

print "Recording started. Ending at " + end_time_h + ":" + end_time_m + "\n"

while(not_ended): 
    dt = list(time.localtime())
    hour = dt[3]
    minute = dt[4]
    if hour == int(end_time_h) and minute == int(end_time_m):
       os.popen2("killall acestreamplayer")
       not_ended = 0 

print "Reconding ended\n"
