# Connecting to MongoDB
## /app.js
````
//Set up mongoose connection
var mongoose = require('mongoose');
var mongoDB = 'insert_your_database_url_here';
mongoose.connect(mongoDB, { useNewUrlParser: true });
var db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));
````
### Example
````
const app = express();

//Set up mongoose connection
const mongoose = require('mongoose');
const mongoDB = 'mongodb+srv://vadis:123v456v789@cluster0-ogpmn.mongodb.net/local_library?retryWrites=true&w=majority';
mongoose.connect(mongoDB, { useNewUrlParser: true });
const db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));
````
