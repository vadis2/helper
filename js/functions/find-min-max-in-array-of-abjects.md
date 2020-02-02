# Find min, max in an array of objects
````
[
  {x: 1, y: 14830},
  {x: 2, y: 85055},
  {x: 3, y: 03485},
  {x: 4, y: 57885},
  // ...
]
````
````
function findMinMax(arr) {
  let min = arr[0].y, max = arr[0].y;

  for (let i = 1, len=arr.length; i < len; i++) {
    let v = arr[i].y;
    min = (v < min) ? v : min;
    max = (v > max) ? v : max;
  }

  return [min, max];
}
````
