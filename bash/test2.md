# Description 
Creating virtual site


#!/bin/bash
echo Please, enter your name
read NAME
sudo mkdir -p /var/www/$NAME/public_html
sudo chown -R $USER:$USER /var/www/$NAME/public_html
sudo chmod -R 755 /var/www
sudo touch /var/www/$NAME/public_html/index.html
sudo cat << EOF > /var/www/$NAME/public_html/index.html
<html>
  <head>
    <title>Welcome to Example.com!</title>
  </head>
  <body>
    <h1>Success!  The example.com virtual host is working!</h1>
  </body>
</html>
EOF
sudo cp /etc/apache2/sites-available/example.com.conf /etc/apache2/sites-available/$NAME.conf
sudo cat << EOF > /etc/apache2/sites-available/$NAME.conf
<VirtualHost *:80>
    ServerAdmin admin@example.com
    ServerName $NAME
    ServerAlias www.$NAME
    DocumentRoot /var/www/$NAME/public_html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
sudo a2ensite $NAME.conf
sudo service apache2 restart
sudo chown -R $USER:$USER /var/www/