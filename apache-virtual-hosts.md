# How To Set Up Apache Virtual Hosts on Ubuntu 16.04
```
sudo mkdir -p /var/www/example.com/public_html
```
```
sudo chown -R $USER:$USER /var/www/example.com/public_html
```
```
sudo chmod -R 755 /var/www
```
Create Demo Page
```
sudo nano /var/www/example.com/public_html/index.html
```
```
<html>
  <head>
    <title>Welcome to Example.com!</title>
  </head>
  <body>
    <h1>Success!  The example.com virtual host is working!</h1>
  </body>
</html>
```
```
sudo cp /etc/apache2/sites-available/example.com.conf /etc/apache2/sites-available/example.com.conf
```
```
sudo nano /etc/apache2/sites-available/example.com.conf
```
```
<VirtualHost *:80>
    ServerAdmin admin@example.com
    ServerName example.com
    ServerAlias www.example.com
    DocumentRoot /var/www/example.com/public_html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
```
sudo a2ensite example.com.conf
```
```
sudo service apache2 restart
```
```
sudo nano /etc/hosts
```
Add
```
127.0.0.1       example.com
```
Test http://example.com