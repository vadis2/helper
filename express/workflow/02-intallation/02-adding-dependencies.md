# Adding Dependencies
## Create dir for app
````
mkdir myapp
cd myapp
````
## Create package.json
````
npm init
````
## Create project in IDE
## Check package.json
## Install Express
## Check package.json
## Add Express
````
// index.js
const express = require('express')
const app = express();

app.get('/', (req, res) => {
  res.send('Hello World!')
});

app.listen(8000, () => {
  console.log('Example app listening on port 8000!')
});
````
## Test
````
node index.js
````
## Add Development dependencies
````
npm install eslint --save-dev
````
## Running test
````
"scripts": {
  ...
  "lint": "eslint src/js"
  ...
}
````
To start:
````
npm run-script lint
# OR (using the alias)
npm run lint
````

