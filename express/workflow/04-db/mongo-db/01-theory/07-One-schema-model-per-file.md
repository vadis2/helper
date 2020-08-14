# One schema/model per file
## Defining model
````
// File: ./models/somemodel.js

//Require Mongoose
var mongoose = require('mongoose');

//Define a schema
var Schema = mongoose.Schema;

var SomeModelSchema = new Schema({
  a_string          : String,
  a_date            : Date,
});

//Export function to create "SomeModel" model class
module.exports = mongoose.model('SomeModel', SomeModelSchema );
````
## Using
````
//Create a SomeModel model just by requiring the module
var SomeModel = require('../models/somemodel')

// Use the SomeModel object (model) to find all SomeModel records
SomeModel.find(callback_function);
````



