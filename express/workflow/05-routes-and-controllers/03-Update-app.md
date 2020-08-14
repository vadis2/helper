# Update app.js
Add catalogRouter
````
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var catalogRouter = require('./routes/catalog');  //Import routes for "catalog" area of site
````
````
...
app.use('/catalog', catalogRouter);  // Add catalog routes to middleware chain.
````


