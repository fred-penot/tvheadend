login_ssh=docker

mkdir /home/apps
cd /home/apps
git clone https://github.com/fred-penot/logotv.git
mv /home/apps/logotv /home/apps/logotv2
chmod -Rf 777 /home/apps/logotv2
chown -R ${login_ssh}:${login_ssh} /home/apps
