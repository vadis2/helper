# Handling Errors
## Using
Place it in the end of routes. 404 and other codes are not treated as errors.
````
app.use(function(err, req, res, next) {
  console.error(err.stack);
  res.status(500).send('Something broke!');
});
````
