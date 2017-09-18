# NODE
## installation
https://www.digitalocean.com/community/tutorials/node-js-ubuntu-16-04-ru
cd ~
curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install nodejs
sudo apt-get install build-essential


## installation
```
sudo apt-get update
sudo apt-get install nodejs
sudo apt-get install npm
```
To ckeck version of nodejs:
```
node -v
or
nodejs --version
```
## Versions in dependencies
https://github.com/npm/node-semver

## Insert symlink
```
sudo ln -s /usr/bin/nodejs /usr/bin/node
```
static .

## Commands
|to do                                             |command                  |
|--------------------------------------------------|-------------------------|
|How to list npm user-installed globally packages? |npm list -g --depth=0    |