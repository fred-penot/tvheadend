rm - Rf /home/hts/.hts/tvheadend/channel
rm - Rf /home/hts/.hts/tvheadend/epggrab

cd /home/hts/.hts/tvheadend

unzip channel.zip
rm -f channel.zip
chown -R hts:video /home/hts/.hts/tvheadend/channel
chown -R hts:video /home/hts/.hts/tvheadend/epggrab