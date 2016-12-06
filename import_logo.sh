login_ssh=docker

mkdir -p /home/apps
cd /home/apps
git clone https://github.com/fred-penot/logotv.git
chmod -Rf 777 /home/apps/logotv
chown -R ${login_ssh}:${login_ssh} /home/apps
