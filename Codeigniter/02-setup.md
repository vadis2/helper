# Create IDE project

# Setup
## Create DB
## Config
### config.php
 Delete index.php 
 
 Base URL
 ````
 /* Base url detection CI 3 */
 $offset = explode('index.php', $_SERVER['SCRIPT_NAME']);
 $offset = $offset[0];
 if (!defined('URL_OFFSET')) define('URL_OFFSET', $offset);
 $protocol = 'http';
 if (isset($_SERVER['HTTPS'])) {
     if ('on' == $_SERVER['HTTPS']) $protocol = 'https';
 }
 $base_url = $protocol.'://'.$_SERVER['SERVER_NAME'].$offset;
 
 $config['base_url']	= $base_url;
 ````

### .htaccess
````
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ index.php/$1 [L]
````
### .conf для apache2
````
sudo nano /etc/apache2/sites-enabled/chang.com.conf

<VirtualHost *:80>
    <Directory /var/www/plexidoc2.com/public_html/codeigniter>
         Options Indexes FollowSymLinks MultiViews
         AllowOverride All
         Order allow,deny
         allow from all
    </Directory>

    . . .
</VirtualHost>

sudo service apache2 restart
````

### database.php 
````
...
'hostname' => 'localhost',
'username' => 'root',
'password' => '456v123',
'database' => 'cihmvcd',
'dbdriver' => 'mysqli',
````
## Check site url
You must see welcome page.



