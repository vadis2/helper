# Installation on online server from bitbucket first commit
## Install local with composer
````
composer create-project --prefer-dist laravel/laravel blog
````
## Edit .gitignore
Delete restriction for /vendor
## Create first commit
## Create first push
## Clone in online server from the bitbucket repo

## Do configuration
https://laravel.com/docs/5.4/installation#configuration

## Change site configuration (nginx)
https://laravel.com/docs/5.4/installation#pretty-urls

## Edit .gitignore
Add restriction for /vendor
## Delete vendor from local git
````
git rm -r --cached vendor
````
## Do commit and push to bitbucket
## Change in online server .gitignore
Add restriction for /vendor
## Pull in online server from the bitbucket repo
