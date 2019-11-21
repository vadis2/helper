# selectBy
````
function groupBy(list, keyGetter) {
    const map = new Map();
    list.forEach((item) => {
         const key = keyGetter(item);
         const collection = map.get(key);
         if (!collection) {
             map.set(key, [item]);
         } else {
             collection.push(item);
         }
    });
    return map;
}

// example usage

const pets = [
    {type:"Dog", name:"Spot"},
    {type:"Cat", name:"Tiger"},
    {type:"Dog", name:"Rover"}, 
    {type:"Cat", name:"Leo"}
];
    
const grouped = groupBy(pets, pet => pet.type);
    
console.log(grouped.get("Dog")); // -> [{type:"Dog", name:"Spot"}, {type:"Dog", name:"Rover"}]
console.log(grouped.get("Cat")); // -> [{type:"Cat", name:"Tiger"}, {type:"Cat", name:"Leo"}]
    
    
````
