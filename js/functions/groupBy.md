# groupBy

````
function groupBy(xs, f) {
  return xs.reduce((r, v, i, a, k = f(v)) => ((r[k] || (r[k] = [])).push(v), r), {});
}

const cars = [{ make: 'audi', model: 'r8', year: '2012' }, { make: 'audi', model: 'rs5', year: '2013' }, { make: 'ford', model: 'mustang', year: '2012' }, { make: 'ford', model: 'fusion', year: '2015' }, { make: 'kia', model: 'optima', year: '2012' }];

const result = groupBy(cars, (c) => c.make);
console.log(result);
````
````
{
  "audi": [
    {
      "make": "audi",
      "model": "r8",
      "year": "2012"
    },
    {
      "make": "audi",
      "model": "rs5",
      "year": "2013"
    }
  ],
  "ford": [
    {
      "make": "ford",
      "model": "mustang",
      "year": "2012"
    },
    {
      "make": "ford",
      "model": "fusion",
      "year": "2015"
    }
  ],
  "kia": [
    {
      "make": "kia",
      "model": "optima",
      "year": "2012"
    }
  ]
}
````
