```
lsCategories.forEach(function (obj, index) {
  newArr.push({
    value: obj.id,
    text: obj.name
  });
});
newArr.sort((a,b) => {return (a.text > b.text) ? 1 : ((b.text > a.text) ? -1 : 0);} );
```
