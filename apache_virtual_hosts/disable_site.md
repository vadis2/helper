# How disable site
````
sudo a2dissite example.com.conf

sudo rm -f /etc/apache2/sites-available/example.com.conf
sudo rm -rf /var/www/example.com.conf
````

```
sudo nano /etc/hosts
```
Delete
```
127.0.0.1       example.com
```
Test http://example.com
```
```
sudo service apache2 restart
```
