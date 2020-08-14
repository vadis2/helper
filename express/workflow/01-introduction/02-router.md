# Router
Available methods:
````
get(), post(), put(), delete(), options(), trace(), copy(), lock(), mkcol(), move(), purge(), propfind(), proppatch(), unlock(), report(), ​​​​​​ mkactivity(), checkout(), merge(), m-search(), notify(), subscribe(), unsubscribe(), patch(), search(), and connect().
````

Router file:
````
// wiki.js - Wiki route module

var express = require('express');
var router = express.Router();

// Home page route
router.get('/', function(req, res) {
  res.send('Wiki home page');
});

// About page route
router.get('/about', function(req, res) {
  res.send('About this wiki');
});

module.exports = router;
````

Using router file:
````
var wiki = require('./wiki.js');
// ...
app.use('/wiki', wiki);
````

Using all() for middleware, for example:
````
app.all('/secret', function(req, res, next) {
  console.log('Accessing the secret section ...');
  next(); // pass control to the next handler
});
````

