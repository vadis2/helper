# Form Create
We will create "genre".
## Controller
### Import validation and sanitization methods
genreController:
````
const validator = require('express-validator');
````
### Controller—get route
genre_create_get():
````
// Display Genre create form on GET.
exports.genre_create_get = function(req, res, next) {     
  res.render('genre_form', { title: 'Create Genre' });
};
````
### Controller—post route
genre_create_post():
````
// Handle Genre create on POST.
exports.genre_create_post =  [
   
  // Validate that the name field is not empty.
  validator.body('name', 'Genre name required').trim().isLength({ min: 1 }),
  
  // Sanitize (escape) the name field.
  validator.sanitizeBody('name').escape(),

  // Process request after validation and sanitization.
  (req, res, next) => {

    // Extract the validation errors from a request.
    const errors = validator.validationResult(req);

    // Create a genre object with escaped and trimmed data.
    var genre = new Genre(
      { name: req.body.name }
    );


    if (!errors.isEmpty()) {
      // There are errors. Render the form again with sanitized values/error messages.
      res.render('genre_form', { title: 'Create Genre', genre: genre, errors: errors.array()});
      return;
    }
    else {
      // Data from form is valid.
      // Check if Genre with same name already exists.
      Genre.findOne({ 'name': req.body.name })
        .exec( function(err, found_genre) {
           if (err) { return next(err); }

           if (found_genre) {
             // Genre exists, redirect to its detail page.
             res.redirect(found_genre.url);
           }
           else {

             genre.save(function (err) {
               if (err) { return next(err); }
               // Genre saved. Redirect to genre detail page.
               res.redirect(genre.url);
             });

           }

         });
    }
  }
];
````
## View
