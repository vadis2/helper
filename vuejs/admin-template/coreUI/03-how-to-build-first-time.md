# How to build first time
1. Do git commit
2. Check vue.config.js:
````
publicPath: '/',
````
3. Config virtual domain: root must leads to directory "dist".
4. Check back-end routes: 
```` 
header('Access-Control-Allow-Origin:  http://wnyfe.com');
```` 
(not localhost:8080)
