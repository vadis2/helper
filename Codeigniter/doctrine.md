# Doctrine
## Link
http://stackoverflow.com/questions/33209930/how-to-install-doctrine-in-codeigniter-3

### If HMVC see composer.json here
http://stackoverflow.com/questions/31308902/integrate-gedmo-doctrine-extension-with-codeigniter

https://github.com/santhapa/ci3-hmvc-doctrine-di/blob/master/composer.json

## create new branch install_doctrine
````
git co -b install_doctrine
````
## Change composer.json
Must be
````
{
    "require": {
        "doctrine/orm": "*"
    }
}
````
## Install Doctrine 
````
!!check composer
composer
cd to project
composer update
````
## Integrating with CodeIgniter
Add a php file to your system/application/libraries folder called Doctrine.php

https://www.phpclasses.org/blog/post/261-Working-with-CodeIgniter-HMVC-Framework-Smarty-Template-and-Doctrine-ORM-all-together.html

https://searchcode.com/codesearch/view/71394488/

https://gitlab.com/bjsmasth007/codeigniter-with-doctrine-and-hmvc/blob/94982f498b672d111af8fcf359b2b6bec85a1c9b/application/models/Entity/User.php

https://github.com/santhapa/ci3-hmvc-doctrine-di/blob/master/application/modules/blog/models/Post.php
