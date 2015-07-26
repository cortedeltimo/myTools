 #!/bin/bash

if [ -z "$1" ]
  then
	echo ""
	echo "Usage: ./acestream.sh <command> <channel> [<start_time> <end_time> <output_file>]"
	echo ""
	echo "<command>: play, stream or rec"
	echo "<start_time>, <end_time>: (for rec mode only) Start/End time for recording in format HH:MM "
	echo "<output_file>: (for rec mode only) name of output file for recording " 
	echo ""
	exit 1
fi


if [ $2 = "av1" ];
then 
	acechannel="acestream://d2340e7fdf87b7f666efda5990a6e34957e20141"
elif [ $2 = "av2" ];
then
	acechannel="acestream://cced7190b0f13010dd3c28208dd8f26604d08087"
elif [ $2 = "av3" ];
then
	acechannel="acestream://b8a70013dcefbeb0356c91d39a4f6d20dfba6db1"
elif [ $2 = "av4" ];
then
	acechannel="acestream://003aedb6915adc5bca1fc18a7ad4845a504fcdd8"
elif [ $2 = "av5" ];
then
	acechannel="acestream://775bc64c1fe86fe499b618ccdb6009ac63416350"
elif [ $2 = "av6" ];
then
	acechannel="acestream://02b9e10f949afa5ed376f4f9e7de4ab5c1f31d2e"
elif [ $2 = "av15" ];
then
	acechannel="acestream://e7d0165473ef101ff703031316c18fd05aaaaf96"
else	
	acechannel="acestream://$2"
	echo "Playing $2"
fi

if [ $1 = "play" ];
then
	echo "Playing... $acechannel"
	acestreamplayer $acechannel
elif [ $1 = "stream" ];
then 
	echo "Streaming.... $acechannel"
	acestreamplayer $acechannel --sout "#transcode{vcodec=h264,vb=800,acodec=mpga,ab=128,channels=2,samplerate=44100}:http{mux=ts,dst=:8080/f1}" --sout-keep
elif [ $1 = "rec" ];
then
	echo "Recording.... $acechannel"
	python pvr.py $acechannel $3 $4 $5
fi
