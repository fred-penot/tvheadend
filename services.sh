login_ssh="docker"

service ssh start > /home/${login_ssh}/services.log
service apache2 start >> /home/${login_ssh}/services.log
service tvheadend start >> /home/${login_ssh}/services.log
chmod -f 777 /home/${login_ssh}/services.log
chmod -Rf 777 /home/hts/.hts/tvheadend
