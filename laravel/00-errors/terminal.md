# file_put_contents(/usr/share/nginx/srs4.com/srs/vendor/composer/autoload_namespaces.php): failed to open stream: Pe  
    rmission denied
See Vendor access (lock in PHPStorm)
Change permissions
````
sudo chown -R $USER:$USER /var/www/abp.com
or
sudo chown -R $USER:$USER /usr/share/nginx/srs4.com
````