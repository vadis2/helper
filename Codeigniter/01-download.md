# Download
## Link
````
https://www.codeigniter.com/
````
# Create project
https://github.com/vadis2/helper/blob/master/wokflow-php-project.md

## Move to the project
````
sudo mv fromPath/ toPath/
sudo mv /home/vadis/Downloads/CodeIgniter-3.1.2.zip /var/www/cihmvcd.com/public_html
or 
cp -b /home/untitelds.mpg /media/sda3/SkyDrive
````
## Unzip
````
cd /var/www/cihmvcd.com/public_html
ls
unzip CodeIgniter-3.1.2.zip
````
## Rename root app folder to codeigniter
````
ls
sudo mv CodeIgniter-3.1.2 codeigniter
ls
````
## Delete zip and other useless files
````
sudo rm -f index.html
sudo rm -f CodeIgniter-3.1.2.zip
ls
````
## Change settings of virtual host
````
sudo chown -R $USER:$USER /var/www/example.com/public_html/codeigniter
sudo chown -R $USER:$USER /var/www/example.com/
sudo nano /etc/apache2/sites-available/example.com.conf

<VirtualHost *:80>
    ServerAdmin admin@example.com
    ServerName cihmvcd.com
    ServerAlias www.cihmvcd.com
    DocumentRoot /var/www/cihmvcd.com/public_html/codeigniter
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

sudo a2ensite example.com.conf
sudo service apache2 restart
````
## Create bash alias
````
gedit ~/.bashrc
cd ~
. ~/.bashrc
````

