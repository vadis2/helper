# Find in array of objects
## Given
````
myArray = [{'id':'73','foo':'bar'},{'id':'45','foo':'bar'}, etc.]
````
## Find id = 45
````
myArray.find(x => x.id === '45').foo;
````

From MDN: 
The find() method returns the first value in the array, if an element in the array satisfies the provided testing function. Otherwise undefined is returned.

## If you want to find its index instead, use findIndex():
````
myArray.findIndex(x => x.id === '45');
````
From MDN: The findIndex() method returns the index of the first element in the array that satisfies the provided testing function. Otherwise -1 is returned.

## If you want to get an array of matching elements, use the filter() method instead:
````
myArray.filter(x => x.id === '45');
````
This will return an array of objects. 

## If you want to get an array of foo properties, you can do this with the map() method:
````
myArray.filter(x => x.id === '45').map(x => x.foo);
````
Side note: methods like find() or filter(), and arrow functions are not supported by older browsers (like IE), so if you want to support these browsers, you should transpile your code using Babel (with the polyfill).
