# Create virtual host
````
sudo /bin/test2.sh
sudo nano /etc/hosts
sudo chmod -R 755 /var/www
sudo chown -R $USER:$USER /var/www
```
Add
```
127.0.0.1       example.com
```
Test http://example.com