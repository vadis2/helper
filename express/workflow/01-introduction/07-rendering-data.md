# Rendering Data
Express has support for a number of template engines MongoDB, etc

## Using
### Config
````
var express = require('express');
var app = express();

// Set directory to contain the templates ('views')
app.set('views', path.join(__dirname, 'views'));

// Set view engine to use, in this case 'some_template_engine_name'
app.set('view engine', 'some_template_engine_name');
````
### Using
````
app.get('/', function(req, res) {
  res.render('index', { title: 'About dogs', message: 'Dogs rock!' });
});
````
