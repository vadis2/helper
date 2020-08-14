# Enable server restart on file changes
## Installation
````
npm install --save-dev nodemon
````
## Check Installation
Check package.json

## Add to package.json
````
"scripts": {
    "start": "node ./bin/www",
    "devstart": "nodemon ./bin/www",
    "serverstart": "DEBUG=express-locallibrary-tutorial:* npm run devstart"
},
````
## Check script
````
npm run serverstart
````
