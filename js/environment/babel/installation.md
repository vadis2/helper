# Installation
````
npm install --save-dev @babel/core @babel/cli @babel/node @babel/preset-env
````
## babel.config.js
````
module.exports = {
  presets: [
    ['@babel/env', {
      targets: {
        node: 'current'
      },
    }],
  ],
};
````
## create dist to keep translated code
````
npx babel src --out-dir dist
````
Add to packages.json
````
"files": [
  "dist"
]
````

## To first build and then translate add to packages.json:
````
"scripts": {
  "build": "NODE_ENV=production babel src --out-dir dist",
  "prepublishOnly": "npm run build"
}
````
## To run new file through node:
1. Делаем изменение.
2. Транслируем код с помощью Babel.
3. Запускаем на выполнение.

or by 1 command:
````
npx babel-node src/index.js.
````

## Source-mapping (for back-tracing)
````
npx babel script.js --out-file script-compiled.js --source-maps inline
Example:
npx babel src/half.js --out-file dist/half.js --source-maps inline
````

