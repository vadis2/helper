# Custom rule
1.add logic
````
const alphaNumSpace = (value) => {
    if (typeof value === 'undefined' || value === null || value === '') {
        return true
    }
    return /^[0-9a-zA-Z #]*$/.test(value)
};
````
2.add to field validation
````
validations: {
    name: {
        required,
        minLength: minLength(3),
        alphaNumSpace
    },
````
