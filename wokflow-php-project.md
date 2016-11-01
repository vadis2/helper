# WORKFLOW. PHP PROJECT
Create local domain (https://github.com/vadis2/helper/blob/master/apache-virtual-hosts.md)

Create project in IDE.

Insert alias in bash (https://github.com/vadis2/helper/blob/master/bash.md).
 
Create GitHub project (https://github.com/vadis2).

Git init.

Create gitignore.

Push.

## Set permissions
```
sudo chown -R $USER:$USER /var/www/example.com/public_html
sudo chmod -R 755 /var/www
sudo service apache2 restart
```