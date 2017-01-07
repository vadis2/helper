# WORKFLOW. PHP PROJECT
Create local domain (https://github.com/vadis2/helper/blob/master/apache-virtual-hosts.md)

For local project:
````
sudo chown -R $USER:$USER /var/www/
````
Create project in IDE.

Insert alias in bash (https://github.com/vadis2/helper/blob/master/bash.md).
 
Create GitHub project (https://github.com/vadis2).

Git init.

## Start from local project
Create gitignore.

```
git remote add origin git@github.com:vadis2/cihmvcd.git
git push -u origin master
```


## Start from git repo
```
git remote add origin https://vvadis@bitbucket.org/iqdesk/newplexidoc.git
git fetch && git checkout master
```
## Set permissions
```
sudo chown -R $USER:$USER /var/www/example.com/public_html
sudo chmod -R 755 /var/www
sudo service apache2 restart
```

## For CodeIgniter
https://github.com/vadis2/helper/blob/master/Codeigniter/02-setup.md

## Create branches
https://github.com/vadis2/helper/blob/master/git/commands.md