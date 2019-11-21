# Sort array of objects with hierarchy by hierarchy and name
## Source link
https://stackoverflow.com/questions/35329658/sort-array-of-objects-with-hierarchy-by-hierarchy-and-name
## Working vue page
http://localhost:8081/#/admin/organization/create
## Code
````
<script>

function hierarchySortFunc(a,b ) {
  if(a.name > b.name) {
      return 1;
    } else {
      return -1
    }  
}

function hierarhySort(hashArr, key, result) {

  if (hashArr[key] == undefined) return;
  var arr = hashArr[key].sort(hierarchySortFunc);
  for (var i=0; i<arr.length; i++) {
    result.push(arr[i]);
    hierarhySort(hashArr, arr[i]._id, result);
  }

  return result;
}

var arr = [ 
    { _id: 1, parent: 0, name: 'Z' },
    { _id: 2, parent: 1, name: 'H' },
    { _id: 3, parent: 1, name: 'Z' },
    { _id: 4, parent: 0, name: 'A' },
    { _id: 5, parent: 4, name: 'M' },
    { _id: 6, parent: 4, name: 'N' },
    { _id: 7, parent: 2, name: 'L' },
    { _id: 8, parent: 2, name: 'G' }
]

var hashArr = {};

for (var i=0; i<arr.length; i++) {
  if (hashArr[arr[i].parent] == undefined) hashArr[arr[i].parent] = [];
  hashArr[arr[i].parent].push(arr[i]);
}

var result = hierarhySort(hashArr, 0, []);

for (var i=0; i<result.length; i++) console.log(result[i]);

</script>
````
