# ENVIRONMENT
```
dev
prod
test
```
## setup env
```
http://localhost:8000/app_dev.php/genus/octopus
or
http://localhost:8000/app.php/genus/octopus
```
```
app/config:
config_dev.yml
config_prod.yml
config.yml
parameters.yml
```
## parameters
```
parameters:
    locale: en
    
framework:
    default_locale:  "%locale%"
```
Don't commit parameters.yml to the repo. It's specific for the machine.
### useful
```
kernel.bundles                                                          {"FrameworkBundle":"Symfony\\Bundle\\FrameworkBundle\\Framew...                             
kernel.cache_dir                                                        /home/vadis/Projects/learn_symfony/aqua_note/var/cache/dev                                  
kernel.charset                                                          UTF-8                                                                                       
kernel.container_class                                                  appDevDebugProjectContainer                                                                 
kernel.debug                                                            true                                                                                        
kernel.default_locale                                                   en                                                                                          
kernel.environment                                                      dev                                                                                         
kernel.http_method_override                                             true                                                                                        
kernel.logs_dir                                                         /home/vadis/Projects/learn_symfony/aqua_note/var/logs                                       
kernel.name                                                             app                                                                                         
kernel.root_dir                                                         /home/vadis/Projects/learn_symfony/aqua_note/app                                            
kernel.secret                                                           dbc6013d52d23ba7029768ccd26092cc5b508b8b                                                    
kernel.trusted_hosts                                                    []                                                                                          
kernel.trusted_proxies                                                  [] 
```
