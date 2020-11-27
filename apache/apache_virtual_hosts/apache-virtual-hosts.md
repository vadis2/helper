# How To Set Up Apache Virtual Hosts on Ubuntu 16.04
Domain name can't include "_".
```
sudo mkdir -p /var/www/auct.com/public_html
```
```
sudo chown -R $USER:$USER /var/www/auct.com/public_html
```
```
sudo chmod -R 755 /var/www
```
Create Demo Page
```
sudo nano /var/www/auct.com/public_html/index.html
```
```
<html>
  <head>
    <title>Welcome to Example.com!</title>
  </head>
  <body>
    <h1>Success!  The auct.com virtual host is working!</h1>
  </body>
</html>
```
```
sudo cp /etc/apache2/sites-available/auct.com.conf /etc/apache2/sites-available/auct.com.conf
```
```
sudo nano /etc/apache2/sites-available/auct.com.conf
```
```
<VirtualHost *:80>
    ServerAdmin admin@auct.com
    ServerName auct.com
    ServerAlias www.auct.com
    DocumentRoot /var/www/auct.com/public_html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
```
sudo a2ensite auct.com.conf
```
```
sudo service apache2 restart
or
systemctl reload apache2
```
```
sudo nano /etc/hosts
```
Add
```
127.0.0.1       auct.com
```
Test http://auct.com
