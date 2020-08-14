# Date formatting using moment
## Install moment
````
npm install moment
````
## Check package.json
## Create the virtual property
### Open ./models/bookinstance.js.
### Import moment
````
var moment = require('moment');
````
#### Add the virtual property due_back_formatted
````
BookInstanceSchema
    .virtual('due_back_formatted')
    .get(function () {
    return moment(this.due_back).format('MMMM Do, YYYY');
});
````
#### Update the view
````
if val.status != 'Available'
        //span  (Due: #{val.due_back} )
        span  (Due: #{val.due_back_formatted} ) 
````
## Check view
