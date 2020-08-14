# Theory. Async
## Single asynchronous
````
exports.some_model_count = function(req, res, next) {
 
  SomeModel.count({ a_model_field: 'match_value' }, function (err, count) {
    // ... do something if there is an err

    // On success, render the result by passing count into the render function (here, as the variable 'data').
    res.render('the_template', { data: count } );
  });
}
````
## Asynchronous operations in parallel
````
async.parallel({ 
  one: function(callback) { ... },
  two: function(callback) { ... },
  ...
  something_else: function(callback) { ... }
  }, 
  // optional callback
  function(err, results) {
    // 'results' is now equal to: {one: 1, two: 2, ..., something_else: some_value}
  }
);
````
One response "error" will lead to total "error".

## Asynchronous operations in series
If the order of starting is not important then first arg is an object:
````
async.series({ 
  one: function(callback) { ... },
  two: function(callback) { ... },
  ...
  something_else: function(callback) { ... }
  }, 
  // optional callback after the last asynchronous function completes.
  function(err, results) {
    // 'results' is now equals to: {one: 1, two: 2, ..., something_else: some_value} 
  }
);
````
If the order of starting is important then first arg is an array:
````
async.series([ 
  one: function(callback) { ... },
  two: function(callback) { ... },
  ...
  something_else: function(callback) { ... }
  ], 
  // optional callback after the last asynchronous function completes.
  function(err, results) {
    // 'results' is now equals to: {one: 1, two: 2, ..., something_else: some_value} 
  }
);
````
 ## Dependent asynchronous operations in series
````
async.waterfall([
  function(callback) {
    callback(null, 'one', 'two'); 
  }, 
  function(arg1, arg2, callback) { 
    // arg1 now equals 'one' and arg2 now equals 'two' 
    callback(null, 'three'); 
  }, 
  function(arg1, callback) {
    // arg1 now equals 'three'
    callback(null, 'done');
  }
], function (err, result) {
  // result now equals 'done'
}
);
````
 
