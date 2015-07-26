#!/bin/bash
 
width=480
height=272
infile="$1"
outfile="$1-innotab.avi"
 
if [[ `uname` == "Darwin" ]]; then
	echo "MacOS avconv detected.  Using codec 'mp3'"
	acodec="mp3"
elif [[ `uname` == "Linux" ]]; then
	echo "Linux avconv detected.  Using coded 'libmp3lame'"
	acodec="libmp3lame"
else
	echo "Unknown OS.  This has only been tested on MacOS and Linux.  Aborting."
	exit
fi
 
ffmpeg \
-i "$infile" \
-vcodec mjpeg -acodec $acodec \
-filter:v "scale=iw*min($width/iw\,$height/ih):ih*min($width/iw\,$height/ih), pad=$width:$height:($width-iw*min($width/iw\,$height/ih))/2:($height-ih*min($width/iw\,$height/ih))/2" \
-s 480x272 \
-b:v 600k -q:v 20 -b:a 96k \
"$outfile"

