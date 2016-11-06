# SYMFONY. GET STARTED
## links
https://symfony.com/doc/current/setup.html

## install symfony installer 
``` 
sudo mkdir -p /usr/local/bin
sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony
``` 
## install new project
```
cd my_project_parent_dir
sudo symfony new my_project_name
or
symfony new my_project_name 2.8
```

## Running the Symfony Application
```   
cd my_project_name/
sudo php bin/console server:run
or
sudo php app/console server:run
or
sudo php bin/console server:start
```   
Open http://localhost:8000/

## symfony 3
1. Change your current directory to /home/vadis/Projects/learn_symfony/aqua_note
2. Configure your application in app/config/parameters.yml file.
3. Run your application:
..1. Execute the php bin/console server:start command.
..2. Browse to the http://localhost:8000 URL.
4. Read the documentation at http://symfony.com/doc
## Install Plugins
PHP Annotations

Symfony Plugin

## Create alias in bash

## Create PHPStorm project