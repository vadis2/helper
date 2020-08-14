# Static Files
## Using
````
app.use(express.static('public'));
````
### URL address
````
http://localhost:3000/images/dog.jpg
http://localhost:3000/css/style.css
http://localhost:3000/js/app.js
http://localhost:3000/about.html
````
### Multiple using
````
app.use(express.static('public'));
app.use(express.static('media'));
````
### Virtual prefix
````
app.use('/media', express.static('public'));
````
####
````
### URL address
````
http://localhost:3000/media/images/dog.jpg
http://localhost:3000/media/video/cat.mp4
http://localhost:3000/media/cry.mp3
````
