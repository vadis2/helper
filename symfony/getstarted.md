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
