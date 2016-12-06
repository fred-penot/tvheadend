login_ssh=docker

cd /var/www/html
git clone https://github.com/fred-penot/logotv.git
chmod -Rf 777 /var/www/html/logotv
chown -R ${login_ssh}:${login_ssh} /var/www/html/logotv