# Validation and sanitization
## Install
````
npm install express-validator
````
## Documentation
[express-validator](https://express-validator.github.io/docs/)
## Using
````
const { body,validationResult } = require('express-validator/check');
const { sanitizeBody } = require('express-validator/filter');

body('name', 'Empty name').isLength({ min: 1 }), 
body('age', 'Invalid age').optional({ checkFalsy: true }).isISO8601(),

sanitizeBody('name').trim().escape(),
sanitizeBody('date').toDate(),

(req, res, next) => {
    // Extract the validation errors from a request.
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        // There are errors. Render form again with sanitized values/errors messages.
        // Error messages can be returned in an array using `errors.array()`.
        }
    else {
        // Data from form is valid.
    }
}
````
### Chain
````
body('name').isLength({ min: 1 }).trim().withMessage('Name empty.')
    .isAlpha().withMessage('Name must be alphabet letters.'),
````
## Routes
````
// GET request for creating a Genre. NOTE This must come before route that displays Genre (uses id).
router.get('/genre/create', genre_controller.genre_create_get);

// POST request for creating Genre.
router.post('/genre/create', genre_controller.genre_create_post);
````
