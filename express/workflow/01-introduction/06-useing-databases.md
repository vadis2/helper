# Using DB
## Install driver
````
npm install mongodb
````
There are many options, including PostgreSQL, MySQL, Redis, SQLite, MongoDB, etc

## Using
````
var MongoClient = require('mongodb').MongoClient;

MongoClient.connect('mongodb://localhost:27017/animals', function(err, db) {
  if (err) throw err;

  db.collection('mammals').find().toArray(function (err, result) {
    if (err) throw err;

    console.log(result);
  });
});
````
