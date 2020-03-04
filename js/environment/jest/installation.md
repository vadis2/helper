# Installation
## Install packages.json
````
npm init
````

## Install jest
````
npm i --save-dev jest
````

## To support Babel
````
npm i --save-dev babel-jest @babel/core @babel/preset-env
````

## Create babel.config.js in the root
````
module.exports = {
  presets: [['@babel/preset-env', {targets: {node: 'current'}}]],
};
````

## Create __tests__ in the root

## Create test: ````<name>.test.js````
