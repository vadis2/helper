# Installation
1.Create dir.
````
cd ~/Documents/Projects
mkdir vue-test-book-0 && cd $_
````
2.Installation Make permissions
````
cd ~/Documents
sudo chown -R $USER:$USER Projects
sudo chmod -R 755 Projects
````
3.Install Vue
````
cd ~/cd Documents/Projects/project_name
vue create project-name_
cd project-name_
````
Choose Babel, Eslint
4.Install Jest и vue-test-utils
````
npm install --save-dev jest @vue/test-utils
````
````
// package.json
{
  "scripts": {
    "test": "jest"
  }
}
````
To process SFC with Jest:
````
npm install --save-dev vue-jest
````
````
// package.json
// ...
  "jest": {
    "moduleFileExtensions": [
      "js",
      "json",
      // сообщаем Jest что необходимо обрабатывать `*.vue` файлы
      "vue"
    ],
    "transform": {
      // обрабатываем `*.vue` файлы с помощью `vue-jest`
      ".*\\.(vue)$": "<rootDir>/node_modules/vue-jest"
    },
    "moduleNameMapper": {
      "^@/(.*)$": "<rootDir>/src/$1"
    }
  }
````
````
npm install --save-dev babel-jest
````
````
// ...
  "jest": {
    // ...
    "transform": {
      // ...
      // обрабатывать js с помощью `babel-jest`
      "^.+\\.js$": "<rootDir>/node_modules/babel-jest"
    }
    // ...
  }
````
Tests Coverage:
````
"jest": {
    // ...
    "collectCoverage": true,
    "collectCoverageFrom": ["**/*.{js,vue}", "!**/node_modules/**"],
    "coverageReporters": ["html", "text-summary"]
  }
````
To test with snapshots:
````
npm install --save-dev jest-serializer-vue
````
````
{
  // ...
  "jest": {
    // ...
    // сериализатор для снимков
    "snapshotSerializers": ["jest-serializer-vue"]
  }
}
````

4.How to start
Add scripts
````
{
  "scripts": {
    "serve": "vue-cli-service serve",
    "build": "vue-cli-service build"
  }
}
````
To start
````
npm run serve
npm run build
````





