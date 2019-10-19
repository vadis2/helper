# My rules
````
const alphaNumSpace = (value) => {
    if (typeof value === 'undefined' || value === null || value === '') {
        return true
    }
    return /^[0-9a-zA-Z #]*$/.test(value)
};

const alphaSpace = (value) => {
    if (typeof value === 'undefined' || value === null || value === '') {
        return true
    }
    return /^[a-zA-Z #]*$/.test(value)
};
````
