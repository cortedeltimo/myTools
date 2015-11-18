
if [ -z "$(pidof transmission-daemon)" ]
then
   /opt/etc/init.d/S95transmission start
fi
