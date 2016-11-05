# XDEBUG
## install
```
sudo apt-get install php-xdebug
php -m
sudo service apache2 restart
sudo nano /etc/php/7.0/mods-available/xdebug.ini
or
sudo gedit /etc/php/7.0/mods-available/xdebug.ini
sudo service apache2 restart
```
check php.info

Edit php.ini
```
sudo gedit /etc/php/7.0/cli/php.ini
sudo gedit /etc/php/7.0/apache2/php.ini
```
```
zend_extension=usr/lib/php/20151012/xdebug.so
xdebug.remote_enable=1
xdebug.remote_port=9000
xdebug.profiler_enable=1
xdebug.profiler_output_dir=home\tmp
xdebug.idekey=PHPSTORM
```
## Setup configurations in IDE 
https://www.jetbrains.com/help/phpstorm/2016.2/configuring-xdebug.html

1. File/Settings/Languages and Frameworks/PHP
2. Run/Edit configurations click + choose PHP web application
3. Create server (rtasks.com)
4. Run/Web Server Debug Validation (1 error in the list is Ok)

## start
1. Insert breakpoint
2. Click bug



