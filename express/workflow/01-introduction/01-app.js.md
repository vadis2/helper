# 01 app.js
````
let express = require('express');
let app = express();

app.get('/', function(req, res) {
    res.send('Hello World!');
});

app.listen(3002, function() {
    console.log('Example app listening on port 3000!');
});
````
