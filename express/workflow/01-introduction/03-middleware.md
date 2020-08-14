# Middleware
## List of middleware
http://expressjs.com/en/resources/middleware.html
## Install middleware
````
$ npm install morgan
````
## Using
### all()
````
var express = require('express');
var logger = require('morgan');
var app = express();
app.use(logger('dev'));
````
### using third parameter `next`
````
var express = require('express');
var app = express();

// An example middleware function
var a_middleware_function = function(req, res, next) {
  // ... perform some operations
  next(); // Call next() so Express will call the next middleware function in the chain.
}

// Function added with use() for all routes and verbs
app.use(a_middleware_function);

// Function added with use() for a specific route
app.use('/someroute', a_middleware_function);

// A middleware function added for a specific HTTP verb and route
app.get('/', a_middleware_function);

app.listen(3000);
````
