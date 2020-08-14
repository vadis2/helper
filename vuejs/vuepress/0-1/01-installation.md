# Installation
## Start
````
mkdir vadis-vuepress-01
sudo chown -R $USER:$USER vadis-vuepress-01
sudo chmod -R 777 vadis-vuepress-01

cd vadis-vuepress-01
npm init -y
````
## Install vuepress
````
npm install -D vuepress
sudo vuepress dev docs
````
Test page. Must be 404 error.

Open new terminal:
````
mkdir docs
echo '# Hello VuePress' > README.md
````
Test page.

## Create PHPStorm project
## Edit 
````
package.json
"scripts": {
    ...
    "docs:dev": "vuepress dev docs",
    "docs:build": "vuepress build docs"
  }
````
Test: ?????????
````
npm run docs:dev
````
## Default Theme Config
````
cd docs
mkdir .vuepress
touch README.md
````
Insert in README.md
````
---
home: true
heroImage: /hero.png
heroText: Hero Title
tagline: Hero subtitle
actionText: Get Started →
actionLink: /guide/
features:
- title: Simplicity First
  details: Minimal setup with markdown-centered project structure helps you focus on writing.
- title: Vue-Powered
  details: Enjoy the dev experience of Vue + webpack, use Vue components in markdown, and develop custom themes with Vue.
- title: Performant
  details: VuePress generates pre-rendered static HTML for each page, and runs as an SPA once a page is loaded.
footer: MIT Licensed | Copyright © 2018-present Evan You
---
````

Check page:
````
cd to root
npm run docs:dev
````
## Create Directory Structure


## Adding a config file 
````
cd docs/.vuepress
touch config.js
````
Insert in config.js:
````
module.exports = {
 title: 'Hello VuePress',
 description: 'Just playing around'
}
````
Test header in the browser tabs. Must be "Hello VuePress".



